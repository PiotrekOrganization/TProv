##
# Klasa reprezentująca osoby mające dostęp do panelu zarządzania zleceniami.
# Wyróżnione są dwa poziomy autoryzacji: 
#   Administrator (Admin.admin = true)
#     Ma pełen dostęp do zarządzania systemem.
#   Klient (Admin.admin = false)
#     Ma dostęp jedynie do własnych zleceń. Nie ma dostępu do listy użytkowników (wykonawców zleceń).

class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :orders
  has_many :balance_histories

  ##
  # Zwraca listę aktywnych zleceń, należących do tego Administratora/Klienta.
  def active_orders
  	Order.where( :admin_id => self[:id]).where( 'quantity > 0' )
  end

  ##
  # Wyświetla odpowiednią ikonkę w zależności od tego czy osoba ma prawa Administratora, czy Klienta.
  def status_label
  	if self[:admin]
  		"<span class='label label-info'>Admin</span>"
  	else
  		"<span class='label'>Klient</span>"
  	end
  end

  ##
  # Zwraca saldo Administratora/Klienta w formacie 0.00 PLN
  def formatted_balance
  	balance = self[:balance].to_f / 100
  	format('%.2f PLN', balance)
  end
  
end
