class AddAdminColumnToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :admin, :boolean, :default => false
  end
end
