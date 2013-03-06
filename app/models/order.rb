# encoding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :quantity, :user_id, :name, :signs, :description, :price, :ticket_time
  has_many :items
  belongs_to :admin
  
  default_scope order('created_at DESC')

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
		Admin.find(self[:admin_id])
	end

	def completed_items
		Item.where( :order_id => self[:id], :status => 10 )
	end

end
