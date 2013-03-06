class BalanceHistory < ActiveRecord::Base
  attr_accessible :admin_id, :comment, :item_id, :user_id, :value
  belongs_to :admin
  belongs_to :user
  belongs_to :item
  default_scope order('created_at DESC')

  def formatted_value
  	balance = self[:value].to_f / 100
  	format('%.2f PLN', balance)
  end

  def row_class
  	if self[:value] < 0
  		'warning'
  	else
  		'success'
  	end
  end

end
