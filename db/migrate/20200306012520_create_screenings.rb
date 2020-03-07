class CreateScreenings < ActiveRecord::Migration[6.0]
  def change
    create_table :screenings do |t|
      t.integer :movie_id
      t.integer :theatre_id
      t.time :start_at
      t.integer :price

      t.timestamps
    end
    add_index :screenings, :movie_id
    add_index :screenings, :theatre_id
  end
end
