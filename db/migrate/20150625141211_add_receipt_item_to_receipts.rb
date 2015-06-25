class AddReceiptItemToReceipts < ActiveRecord::Migration
  def change
    add_reference :receipts, :receipt_item, index: true, foreign_key: true
  end
end
