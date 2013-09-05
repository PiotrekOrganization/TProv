class AddPaymentIdToBalanceHistory < ActiveRecord::Migration
  def change
    add_column :balance_histories, :payment_id, :integer
  end
end
