class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.text :header, default: ""
      t.text :footer, default: ""
      t.integer :receipt_number
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :receipts, :user_id
  end
end