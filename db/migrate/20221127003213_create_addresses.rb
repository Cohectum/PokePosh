class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :city
      t.integer :province_id
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
