class Page < ActiveRecord::Base
  attr_accessible :content, :name
  validates :content, :presence => true
  validates :name, :presence => true
end
