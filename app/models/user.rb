class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :firstname, :lastname, :type, :confirmed_terms

  validates :confirmed_terms, :numericality => {:only_integer => true, :greater_than => 0}

  has_many :items
  has_many :payments

  def normalized_balance
		price = (self[:balance].to_f / 100)
		("%.2f" % price) + ' PLN'
	end
   
  def can_withdraw_balance?
    return balance > 0
  end

end
