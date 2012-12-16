# encoding: utf-8
class Conflict < ActiveRecord::Base
  attr_accessible :content, :item_id
  validates :content, :presence => true
  validates :item_id, :presence => true

  belongs_to :item

  def author
  	if !self[:admin_id].nil?
  		return Admin.find(self[:admin_id])
  	else 
  		return User.find(self[:user])
  	end
  end

end
