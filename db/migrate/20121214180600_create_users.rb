class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.integer :type

      t.timestamps
    end
  end
end
