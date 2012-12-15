# encoding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :quantity, :user_id
  has_many :items

  def formal_name
   	self[:name] + ' (numer: #' + self[:id].to_s + ')'
	end

	def normalized_price
		price = (self[:price].to_f / 100)
		("%.2f" % price) + ' PLN'
	end

	def price_per_signs
		price = (self[:price].to_f / 100)
		price = price * (1000.0 / self[:signs].to_i)
		("%.2f" % price) + ' PLN / 1000 znaków'
	end

end
