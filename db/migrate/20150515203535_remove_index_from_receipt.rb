class RemoveIndexFromReceipt < ActiveRecord::Migration
  def change
    remove_index :receipts, :user_id
  end
end
