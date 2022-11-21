class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.primary_key :product_id
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
