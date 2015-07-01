class AddReceiptToReceiptItems < ActiveRecord::Migration
  def change
    add_reference :receipt_items, :receipt_number, index: true, foreign_key: true
  end
end
