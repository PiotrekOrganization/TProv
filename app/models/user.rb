class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :firstname, :lastname, :type

  has_many :items

  def balance
  	sum = 0
  	self.items.where(:status => 10).each do |item|
  		sum += item.price
  	end
  	sum
  end

  def normalized_balance
		price = (self.balance.to_f / 100)
		("%.2f" % price) + ' PLN'
	end

end
