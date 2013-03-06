class Admin::BalanceHistoryController < Admin::AdminController

	def index
		@history = current_admin.balance_histories
	end

end