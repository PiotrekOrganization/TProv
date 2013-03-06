class AddBalandeToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :balance, :integer, :default => 0
  end
end
