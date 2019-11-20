class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :hotel, index: true
      t.string :size
      t.integer :max_persons
      t.string :facilities
      t.decimal :price, precision: 8, scale: 2
      t.decimal :sale, precision: 3, scale: 2
      t.string :description

      t.timestamps
    end
  end
end
