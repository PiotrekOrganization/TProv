# encoding: utf-8
class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end



	def write 
	# this method was used to 'Write' button on order#show

		# if current user has an active ticket for this order, redirect to existing ticket
		already_exists = Item.where(:user_id => current_user.id, :order_id => params[:id])
		already_exists.inspect
		unless already_exists.empty?
			redirect_to write_item_path already_exists.first
			return #extremely important !
		end

		# unless, check if there are some free tickets
		@order = Order.find(params[:id])
		if @order.quantity > 0

			# tickets count - 1
			@order.quantity = @order.quantity - 1
			@order.save

			# new item for this order and current user
			i = Item.new
			i.order_id = @order.id
			i.user_id = current_user.id
			i.save
			redirect_to write_item_path(i)
			return #extremely important !

		end

		# there are no tickets left	
		redirect_to orders_path, :notice => "Przepraszamy, to zlecenie już się zakończyło."
		return

	end

end