class CreateReviewImages < ActiveRecord::Migration[5.0]
  def change
    create_table :review_images do |t|
      t.string :link
      t.references :service_review, foreign_key: true

      t.timestamps
    end
  end
end
