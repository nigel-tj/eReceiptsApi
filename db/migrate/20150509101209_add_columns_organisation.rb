class AddColumnsOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :email, :string, default: ""
    add_column :organisations, :contact, :string, default: ""
  end
end
