# coding: utf-8
class Admin::OrdersController < Admin::AdminController

	def index
		if current_admin.admin?
			@orders = Order.all
		else
			@orders = current_admin.orders
		end
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(params[:order])
		@order.admin_id = current_admin.id
		if @order.valid?
			@order.save
			redirect_to admin_orders_path
		else
			flash[:alert] = @order.errors.inspect
			render :new
		end
	end

	def show
		if current_admin.admin?
			@order = Order.find(params[:id])
		else
			@order = current_admin.orders.find(params[:id])
		end
	end

	def edit
		if current_admin.admin?
			@order = Order.find(params[:id])
		else
			@order = current_admin.orders.find(params[:id])
		end
	end

	def update
		if current_admin.admin?
			@order = Order.find(params[:id])
		else
			@order = current_admin.orders.find(params[:id])
		end
		@order.update_attributes(params[:order])
		flash[:notice] = "Zlecenie zostało zmodyfikowane"
		redirect_to admin_order_path(@order)
	end

	def export
		@items = []
		for key,value in params[:item]
			@item = Item.find(key)
			if @item.order.admin = current_admin
				@export_item = @item.content
				@items.push( { :date => @item.updated_at, :content => @export_item } )
			end
		end
		render :xml => @items
	end

	def close
		if current_admin.admin?
			@order = Order.find(params[:id])
		else
			@order = current_admin.orders.find(params[:id])
		end
		@order.quantity = 0
		@order.save
		flash[:notice] = "Zlecenie zostało zakończone"
		redirect_to admin_order_path(@order)
	end

end

class ExportItem
	def initialize(content)
		@content = content
	end
end