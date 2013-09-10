class Admin::PaymentsController < Admin::AdminController

	def index
		@payments = Payment.all

	end

	def complete
		@payment = Payment.find(params[:id])
		@payment.status = Payment::Completed
		@payment.save!
		redirect_to admin_payments_path
	end

end