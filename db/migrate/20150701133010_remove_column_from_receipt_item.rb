class RemoveColumnFromReceiptItem < ActiveRecord::Migration
  def change
    remove_column :receipt_items, :receipt_number_id
  end
end
