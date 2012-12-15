class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def write
		# if current user has an active ticket for this order, redirect to existing ticket
		already_exists = Item.where(:user_id => current_user.id, :order_id => params[:id])
		already_exists.inspect
		unless already_exists.empty?
			redirect_to write_item_path already_exists.first
		end

	end

end