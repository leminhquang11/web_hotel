class CreateHotelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_images do |t|
      t.belongs_to :hotel, index: true
      t.belongs_to :image, index: true

      t.timestamps
    end
  end
end
