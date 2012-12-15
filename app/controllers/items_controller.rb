class ItemsController < ApplicationController

	def write
		@item = Item.find(params[:id])
		@order = @item.order
	end

	def written
		@item = Item.find(params[:id])
		@item.content = params[:item][:content]
		@item.save
		redirect_to item_path(@item)
	end

	def show
		
	end

end