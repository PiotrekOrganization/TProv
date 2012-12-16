# encoding: utf-8
class OrdersController < ApplicationController

	def index
		@orders = Order.where('quantity > 0')
	end

	def show
		@order = Order.find(params[:id])
	end

end