class AddNewItemMailerToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :notify_new_item, :boolean, :default => true
  end
end
