class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pledge_name
      t.string :class_name
      t.date :birthday
      t.string :first_name
      t.string :last_name
      t.string :role, :default => "user"
      t.boolean :alumni, :default => false
      t.string :password_digest

      t.timestamps
    end
  end
end
