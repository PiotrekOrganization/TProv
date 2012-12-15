class AddPriceToOrderAndItem < ActiveRecord::Migration
  def change
  	add_column :orders, :price, :integer
  	add_column :items, :price, :integer
  end
end
