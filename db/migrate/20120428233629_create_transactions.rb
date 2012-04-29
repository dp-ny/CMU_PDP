class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.date :date
      t.text :description
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
