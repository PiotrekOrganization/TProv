class Order < ActiveRecord::Base
  attr_accessible :quantity, :user_id
  has_many :items

  def formal_name
   	self[:name] + ' (numer: #' + self[:id].to_s + ')'
	end
end
