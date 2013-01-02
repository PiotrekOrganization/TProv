class Page < ActiveRecord::Base
  attr_accessible :content, :name, :slug
  validates :content, :presence => true
  validates :name, :presence => true
end
