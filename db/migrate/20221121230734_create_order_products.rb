class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.decimal :price
      t.integer :quantity
      t.integer :cart_id
      t.integer :custom_product_id

      t.timestamps
    end
  end
end
