class ChangeRecieptNumberToString < ActiveRecord::Migration
  def change
    change_column :receipts, :receipt_number, :string
    change_column :receipt_items, :receipt_number, :string
  end
end
