class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
