class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :orders
  has_many :balance_histories

  def active_orders
  	Order.where( :admin_id => self[:id]).where( 'quantity > 0' )
  end

  def status_label
  	if self[:admin]
  		"<span class='label label-info'>Admin</span>"
  	else
  		"<span class='label'>Klient</span>"
  	end
  end

  def formatted_balance
  	balance = self[:balance].to_f / 100
  	format('%.2f PLN', balance)
  end
  
end
