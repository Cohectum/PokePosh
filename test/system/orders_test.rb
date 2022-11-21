require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Order address", with: @order.order_address
    fill_in "Order date", with: @order.order_date
    fill_in "Order", with: @order.order_id
    fill_in "Order postal code", with: @order.order_postal_code
    fill_in "Order province", with: @order.order_province
    fill_in "Order state", with: @order.order_state
    fill_in "Order subtotal", with: @order.order_subtotal
    fill_in "Order tax rate", with: @order.order_tax_rate
    fill_in "Order total", with: @order.order_total
    fill_in "Order tracking number", with: @order.order_tracking_number
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Order address", with: @order.order_address
    fill_in "Order date", with: @order.order_date
    fill_in "Order", with: @order.order_id
    fill_in "Order postal code", with: @order.order_postal_code
    fill_in "Order province", with: @order.order_province
    fill_in "Order state", with: @order.order_state
    fill_in "Order subtotal", with: @order.order_subtotal
    fill_in "Order tax rate", with: @order.order_tax_rate
    fill_in "Order total", with: @order.order_total
    fill_in "Order tracking number", with: @order.order_tracking_number
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
