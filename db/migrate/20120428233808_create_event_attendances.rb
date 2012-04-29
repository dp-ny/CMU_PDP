class CreateEventAttendances < ActiveRecord::Migration
  def change
    create_table :event_attendances do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :present, :default => true
      t.boolean :late, :default => false

      t.timestamps
    end
  end
end
