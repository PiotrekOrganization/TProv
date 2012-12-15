# encoding: utf-8
class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

end