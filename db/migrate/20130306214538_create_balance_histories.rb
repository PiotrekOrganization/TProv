class CreateBalanceHistories < ActiveRecord::Migration
  def change
    create_table :balance_histories do |t|
      t.integer :admin_id
      t.integer :item_id
      t.integer :user_id
      t.string :comment
      t.integer :value

      t.timestamps
    end
  end
end
