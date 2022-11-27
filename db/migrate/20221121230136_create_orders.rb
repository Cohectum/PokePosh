class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :order_subtotal
      t.decimal :order_tax_total
      t.decimal :order_total
      t.string :order_state
      t.string :stripe_id

      t.timestamps
    end
  end
end
