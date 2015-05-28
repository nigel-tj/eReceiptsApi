class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :receipt_number
      t.text :header
      t.text :footer
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :receipts, :user_id
  end
end
