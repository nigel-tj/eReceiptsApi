class AddColumnToken < ActiveRecord::Migration
  def change
    add_column :organisations, :token, :string
    add_index :organisations, :token, unique: true
  end
end
