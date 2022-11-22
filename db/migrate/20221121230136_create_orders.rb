class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :order_subtotal
      t.decimal :order_tax_rate
      t.decimal :order_total
      t.string :order_state
      t.string :order_address
      t.string :order_postal_code
      t.string :order_province
      t.integer :order_tracking_number

      t.timestamps
    end
  end
end
