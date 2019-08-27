class AlterUser < ActiveRecord::Migration[5.2]
  def change
    rename_table("users","admin_users")
  	add_column :admin_users, :username, :string
  end
end
