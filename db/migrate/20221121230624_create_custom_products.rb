class CreateCustomProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_products do |t|
      t.decimal :price
      t.integer :character_id
      t.integer :product_id

      t.timestamps
    end
  end
end
