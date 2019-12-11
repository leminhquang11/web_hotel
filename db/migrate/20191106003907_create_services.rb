class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.text :option
      t.float :price
      t.datetime :start_time
      t.datetime :end_time
      t.references :provider, foreign_key: true
      t.references :category, foreign_key: true
      t.references :place
      t.timestamps
    end
  end
end
