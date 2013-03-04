# encoding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :quantity, :user_id, :name, :signs, :description, :price, :ticket_time
  has_many :items
  belongs_to :admin

  validates :ticket_time, :presence => true
  validates :quantity, :presence => true
  validates :quantity, :presence => true
  validates :price, :numericality => {:only_integer => true, :greater_than => -1}
  validates :quantity, :numericality => {:only_integer => true, :greater_than => -1}
  validates :name, :length => { :in => 14..200 }
  validates :ticket_time, :numericality => {:only_integer => true, :greater_than => 1799}

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

	def creator
		if self[:admin_id].nil?
			Admin.find(self[:admin_id])
		else
			Admin.find(self[:admin_id])
		end
	end

end
