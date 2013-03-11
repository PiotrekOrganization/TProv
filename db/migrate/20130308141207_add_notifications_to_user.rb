class AddNotificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :notify_new_order, :boolean, :default => true
    add_column :users, :notify_item_accept, :boolean, :default => true
    add_column :users, :notify_item_reject, :boolean, :default => true
  end
end
