class CreateServiceImages < ActiveRecord::Migration[5.0]
  def change
    create_table :service_images do |t|
      t.string :link
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
