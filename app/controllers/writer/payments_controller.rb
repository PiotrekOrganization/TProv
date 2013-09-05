# encoding: utf-8
class Writer::PaymentsController < Writer::WriterController

	def index
		@balance_history = BalanceHistory.where( :user_id => current_user.id )
	end

	def make
		@payment = Payment.new
		@payment.value = current_user.balance
	end

	def create
		@payment = Payment.new
		@payment.value = params[:payment][:value]
		@payment.user = current_user
		@payment.status = Payment::Request
		if current_user.balance >= @payment.value
			current_user.balance -= @payment.value
			current_user.save!
			@payment.save!
			balance_history = BalanceHistory.new
			balance_history.payment = @payment
			balance_history.user = current_user
			balance_history.value = @payment.value
			balance_history.comment = "Zlecenie wypłaty ##{@payment.id}"
			balance_history.save!
			flash[:notice] = "Wypłata została zlecona"
			redirect_to writer_payments_path
			return
		else
			flash[:notice] = "Brak wystarczających środków"
			redirect_to writer_payments_path
			return
		end
	end

end	