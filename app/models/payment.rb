class Payment < ActiveRecord::Base

	belongs_to :user
	has_one :balance_history

  PAYMENT_STATUS = [ Request = 'request', Completed = 'completed' ]

  validates_presence_of :value
  validates_presence_of :status

end
