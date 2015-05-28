class CreateReceiptItems < ActiveRecord::Migration
  def change
    create_table :receipt_items do |t|
      t.string :name
      t.string :value
      t.integer :receipt_number

      t.timestamps null: false
    end
    add_index :receipt_items, :receipt_number
  end
end
