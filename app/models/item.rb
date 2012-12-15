class Item < ActiveRecord::Base
  attr_accessible :content, :order_id, :user_id
  belongs_to :order

  def time_left
  	left = self[:expires].to_datetime - DateTime.now
  	left = left * 1.days
  	left.to_i
  end

  def formal_name
  	'numer: #' + self[:id].to_s
  end

end
