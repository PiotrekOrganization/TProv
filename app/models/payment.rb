class Payment < ActiveRecord::Base
  attr_accessible :comment, :status, :user_id, :value
end
