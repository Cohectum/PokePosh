class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.primary_key :shipment_id
      t.date :shipment_date

      t.timestamps
    end
  end
end
