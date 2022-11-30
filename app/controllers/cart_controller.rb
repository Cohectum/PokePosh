class CartController < ApplicationController
  require 'date'

  def show
    @render_cart = false
  end

  def update_prices
    @province = Province.find(params[:tax_province])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace("totals", partial: "cart/total", locals: { province: @province })]
      end
    end
  end

  def add
    new_product_combination = CustomProduct.where(character_id: params[:choice]).where(product_id: params[:id])
    quantity = params[:quantity].to_i
    if params[:commit] == "Update" && quantity.positive?

      current_order_product = OrderProduct.find(params[:order_product_id])
      current_order_product.update(quantity: quantity)
      if current_order_product.custom_product_id != new_product_combination[0].id
        current_order_product.update(custom_product_id: new_product_combination[0].id)
      end

    elsif params[:commit] == "Remove" || quantity < 1

      current_order_product = OrderProduct.find(params[:order_product_id])
      current_order_product.destroy

    elsif params[:commit] == "Add To Cart"

      @cart.order_products.create!(price: new_product_combination[0].price,
                                   custom_product: new_product_combination[0], quantity: quantity)

    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace("cart", partial: "cart/cart", locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    OrderProduct.find_by(id: params[:id]).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace("cart", partial: "cart/cart",
                                                           locals:  { cart: @cart })]
      end
    end
  end

  def checkout
    @render_cart = false
    cart = @cart;
    checkout_items = Array.new
    cart.order_products.each do |product, index|
      checkout_items << {
        price_data: {
          currency: 'cad',
          unit_amount: product.in_cents,
          product_data: {
            name: product.custom_product.product.name,
            description: product.custom_product.product.description,
          },
          tax_behavior: 'exclusive',
        },
        quantity: product.quantity,
      }
    end
    Stripe.api_key = 'sk_test_51M8YIsImcZ7reNdWFyYDqUvNZFyi2eshDo1EInzxlOhqPO7JDomzCRLLHwcvzGaHX6LuPLuMnAtsNVVuvBbU8ld500R9PEwXHf'
    @order = Order.create(
      order_date: Date.today,
      order_subtotal: @cart.total,
      order_state: "New"
    );

    if customer_signed_in?
      @order.customer_id = current_customer.id
      email = current_customer.email
      if current_customer.address
        @order.address_id = current_customer.address.id
        address_used = true
      end
    end
    if !address_used
      email = nil;
      new_address = Address.create(
        province_id: params[:province],
        city: params[:city],
        line1: params[:line1],
        postal_code: params[:postal_code])

        @order.address_id = new_address.id

      if customer_signed_in?
        current_customer.address = new_address
      end
    end



    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: cart_complete_url + "?session_id={CHECKOUT_SESSION_ID}&order_id=#{@order.id}",
      line_items: checkout_items,
      cancel_url: cart_url,
      automatic_tax: { enabled: true },
      mode: "payment",
      customer_email: email
    )

    @order.update(
      stripe_id: @session.id
    )


    redirect_to @session.url, allow_other_host: true
  end

  def complete
    @order = Order.find(params[:order_id])

    if @cart.order_products[0]
      Stripe.api_key = 'sk_test_51M8YIsImcZ7reNdWFyYDqUvNZFyi2eshDo1EInzxlOhqPO7JDomzCRLLHwcvzGaHX6LuPLuMnAtsNVVuvBbU8ld500R9PEwXHf'
      @render_cart = false
      @complete_session = Stripe::Checkout::Session.retrieve(params[:session_id]);

      total = @complete_session.amount_total / 100;
      tax = total - @order.order_subtotal

      @order.update(
        order_total: total,
        order_tax_total: tax,
        order_state: "Paid",
      )

      @order.cart = @cart

      reset_session
    end
  end
end
