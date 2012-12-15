class AddTimeToOrderAndItem < ActiveRecord::Migration
  def change
  	add_column :orders, :ticket_time, :integer
  	add_column :items, :expires, :datetime
  	add_column :items, :status, :integer
  end
end
