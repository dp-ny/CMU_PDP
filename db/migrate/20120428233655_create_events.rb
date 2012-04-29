class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :name
      t.text :description
      t.string :document

      t.timestamps
    end
  end
end
