class Admin::OrdersController < Admin::AdminController

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(params[:order])
		if @order.valid?
			@order.save
			redirect_to admin_orders_path
		else
			flash[:alert] = @order.errors.inspect
			render :new
		end

	end

end