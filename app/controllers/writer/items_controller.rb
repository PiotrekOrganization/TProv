class Writer::ItemsController < Writer::WriterController

	def show

		@item = Item.find(params[:id])

	end

end