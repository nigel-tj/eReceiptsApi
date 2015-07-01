class RemoveReceiptItemFromReceipts < ActiveRecord::Migration
  def change
    remove_reference :receipts, :receipt_item, index: true, foreign_key: true
  end
end
