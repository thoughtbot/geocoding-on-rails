class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :store_number
      t.string :phone_number
      t.string :street_line_1
      t.string :street_line_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country_code
      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10

      t.timestamps
    end

    add_index :locations, :store_number, unique: true
  end
end
