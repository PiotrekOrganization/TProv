class RenameConfirmedTermsColumn < ActiveRecord::Migration
  def up
  	rename_column :users, :confirmed_tems, :confirmed_terms
  end

  def down
  	rename_column :users, :confirmed_terms, :confirmed_tems
  end
end
