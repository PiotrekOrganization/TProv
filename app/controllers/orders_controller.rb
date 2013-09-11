# encoding: utf-8
class OrdersController < ApplicationController


	##
	# Lista aktywnych zleceń na teksty. 
	# params[:q] zawiera dane wyszukiwania (patrz gem ransack)
	def index
		begin
			if params[:q][:price_gteq].to_f > 0
				params[:q][:price_gteq] = params[:q][:price_gteq].to_f * 100
			end
			if params[:q][:price_lteq].to_f > 0
				params[:q][:price_lteq] = params[:q][:price_lteq].to_f * 100
			end
		rescue

		end
		@q = Order.where('quantity > 0').search(params[:q])
		@orders = @q.result

		for condition in @q.conditions
			if condition.attributes.first.name == 'price'
				condition.values.first.value = condition.values.first.value/100
			end
		end

	end

	##
	# Widok pojedynczego tekstu
	def show
		@order = Order.find(params[:id])
		@q = Order.where('quantity > 0').search(params[:q])
	end

end