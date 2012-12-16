class AddItemIdToConflict < ActiveRecord::Migration
  def change
  	add_column :conflicts, :item_id, :integer
  end
end
