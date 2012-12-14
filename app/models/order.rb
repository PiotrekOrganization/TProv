class Order < ActiveRecord::Base
  attr_accessible :quantity, :user_id
end
