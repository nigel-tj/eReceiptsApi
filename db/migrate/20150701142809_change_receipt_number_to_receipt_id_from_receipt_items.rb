class ChangeReceiptNumberToReceiptIdFromReceiptItems < ActiveRecord::Migration
  def change
    rename_column :receipt_items, :receipt_number, :receipt_id
    remove_reference :receipt_items, :receipt_number, index: true, foreign_key: true
    add_reference :receipt_items, :receipt_id, index: true, foreign_key: true
  end
end
