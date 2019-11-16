class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :country
      t.string :city
      t.string :state
      t.string :website
      t.decimal :price_start, precision: 8, scale: 2
      t.decimal :price_end, precision: 8, scale: 2
      t.integer :luxury
      t.string :description
      t.decimal :rate_point, precision: 3, scale: 1
      t.decimal :geo_location, precision: 18, scale: 14
      t.timestamps
    end
  end
end
