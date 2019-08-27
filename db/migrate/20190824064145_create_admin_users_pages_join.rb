class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users_pages do |t|
    	t.references :admin_user
    	t.references :page
    end
  end
end
