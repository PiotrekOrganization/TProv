class Page < ActiveRecord::Base
  attr_accessible :content, :name, :slug
  validates :content, :presence => true
  validates :name, :presence => true

  before_validation :generate_slug
  def generate_slug
    self[:slug] = self[:name].parameterize
  end

end
