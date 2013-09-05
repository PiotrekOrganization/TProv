class ChangePaymentStatusToString < ActiveRecord::Migration
  def up
  	remove_column :payments, :status
  	add_column :payments, :status, :string
  end

  def down
  	remove_column :payments, :status
  	add_column :payments, :status, :integer
  end
end
