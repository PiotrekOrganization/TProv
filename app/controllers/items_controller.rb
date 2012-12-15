class ItemsController < ApplicationController

	def write

		@item = Item.find(params[:id])
		@order = @item.order

	end

end