class AddConfirmedTermsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :confirmed_tems, :integer, :default => 0
  end
end
