class CreateRoomImages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_images do |t|
      t.belongs_to :room, index: true
      t.belongs_to :image, index: true

      t.timestamps
    end
  end
end
