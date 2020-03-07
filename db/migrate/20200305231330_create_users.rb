class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest
      t.integer :gender, null: false, default: 0

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :gender
  end
end
