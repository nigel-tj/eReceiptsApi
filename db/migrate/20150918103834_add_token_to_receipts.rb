class AddTokenToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :token, :string
  end
end
