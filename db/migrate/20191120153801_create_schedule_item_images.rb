class CreateScheduleItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_item_images do |t|
      t.string :link
      t.references :schedule_item, foreign_key: true
      
      t.timestamps
    end
  end
end
