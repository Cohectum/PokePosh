class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.primary_key :customer_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end