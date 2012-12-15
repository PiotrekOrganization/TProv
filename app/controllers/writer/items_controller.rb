class Writer::ItemsController < Writer::WriterController

	def index
		@items = current_user.items
	end

	def show
		@item = current_user.items.find(params[:id])
	end

	def write
		@item = current_user.items.find(params[:item_id])
		@order = @item.order
	end

	def written
		@item = current_user.items.find(params[:item_id])
		@item.content = params[:item][:content]
		@item.save
		redirect_to writer_item_path(@item)
	end

	def close
		@item = current_user.items.find(params[:item_id])
		if @item.status == 0
			@item.status = 5
			@item.save
		end
		redirect_to writer_item_path(@item)
	end

end