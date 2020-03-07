class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :screening_id

      t.timestamps
    end
    add_index :bookings, :user_id
    add_index :bookings, :screening_id
  end
end
