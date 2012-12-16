class CreateConflicts < ActiveRecord::Migration
  def change
    create_table :conflicts do |t|
    	t.text :content
    	t.integer :user_id
    	t.integer :admin_id

      t.timestamps
    end
  end
end
