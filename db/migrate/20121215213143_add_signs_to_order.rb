class AddSignsToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :signs, :integer
  end
end
