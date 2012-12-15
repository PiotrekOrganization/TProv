class Item < ActiveRecord::Base
  attr_accessible :content, :order_id, :user_id
  belongs_to :order
end
