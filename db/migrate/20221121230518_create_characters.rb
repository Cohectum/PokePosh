class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.primary_key :character_id
      t.string :name

      t.timestamps
    end
  end
end
