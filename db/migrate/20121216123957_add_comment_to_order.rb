class AddCommentToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :comment, :text
  	add_column :orders, :admin_id, :integer
  end
end
