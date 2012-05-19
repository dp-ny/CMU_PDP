class CreateUserPositions < ActiveRecord::Migration
  def change
    create_table :user_positions do |t|
      t.integer :user_id
      t.integer :position_id
      t.date :year
      t.string :semester

      t.timestamps
    end
  end
end
