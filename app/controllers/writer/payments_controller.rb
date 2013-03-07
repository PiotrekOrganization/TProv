class Writer::PaymentsController < Writer::WriterController

	def index
		@balance_history = BalanceHistory.where( :user_id => current_user.id )
	end

	def make

	end

end	