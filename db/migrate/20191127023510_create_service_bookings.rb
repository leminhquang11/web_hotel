class CreateServiceBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :service_bookings do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.string :booking_user 
      t.text :booking_address
      t.integer :quantity
      t.float :unit_price
      t.float :total_price
      t.text :confirm_secret_key
      t.references :payment_method, foreign_key: true
      t.references :booking_status, foreign_key: true
      t.timestamps
    end
  end
end
