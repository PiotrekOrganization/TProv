class Writer::ItemsController < Writer::WriterController

	def index
		@items = current_user.items
	end

	def show
		@item = current_user.items.find(params[:id])
	end

	def write
		@item = current_user.items.where(
			:id => params[:item_id],
			:status => 0
		).first()
	end

	def written
		@item = current_user.items.where(
			:id => params[:item_id],
			:status => 0
		).first()
		@item.content = params[:item][:content]
		@item.save
		redirect_to writer_item_path(@item)
	end

	def close
		@item = current_user.items.where(
			:id => params[:item_id],
			:status => 0
		).first()
		@item.status = 5
		@item.save
		redirect_to writer_item_path(@item)
	end

	def delete
		@item = current_user.items.find(params[:item_id])
		@item.destroy
		redirect_to writer_items_path
	end

end