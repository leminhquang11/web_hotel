class CreateServiceReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :service_reviews do |t|
      t.text :title
      t.text :content
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
