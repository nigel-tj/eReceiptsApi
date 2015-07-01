class RemoveUserFromReceipts < ActiveRecord::Migration
  def change
    remove_column :receipts, :user_id
  end
end
