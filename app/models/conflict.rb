# encoding: utf-8

##
# Konflikt powstaje w przypadku, kiedy zamawiający ma uwagi do zrealizowanego przez wykonawcę tekstu. 
# Aby wykonawca mógł otrzymać powód odrzucenia tekstu, Administrator/Klient tworzy konflikt.
# Konflikt jest zawsze przypisany do konkretnego tekstu.
class Conflict < ActiveRecord::Base
  attr_accessible :content, :item_id
  validates :content, :presence => true
  validates :item_id, :presence => true

  belongs_to :item

  ##
  # Osoba będąca autorem uwagi.
  def author
  	if !self[:admin_id].nil?
  		return Admin.find(self[:admin_id])
  	else 
  		return User.find(self[:user])
  	end
  end

end
