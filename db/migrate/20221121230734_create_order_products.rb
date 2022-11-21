class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.primary_key :order_product_id
      t.decimal :price

      t.timestamps
    end
  end
end
