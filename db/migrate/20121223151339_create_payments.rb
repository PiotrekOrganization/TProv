class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.text :comment
      t.integer :status
      t.integer :value

      t.timestamps
    end
  end
end
