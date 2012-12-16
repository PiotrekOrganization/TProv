class Writer::ItemsController < Writer::WriterController

	def index
		if params[:s] != nil
			@items = current_user.items.where(:status => params[:s])
		else
			@items = current_user.items
		end
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
		# check if there is still time for this
		if @item.expires < DateTime.now
			@item.status = 8
			@item.save
			@item.order.quantity = @item.order.quantity + 1
			@item.order.save
		else
			@item.status = 5
		end
		@item.save
		redirect_to writer_item_path(@item)
	end

	def delete
		@item = current_user.items.where(
			:id => params[:item_id],
			:status => 0
		).first
		@item.destroy
		redirect_to writer_items_path
	end

	def refresh
		@item = current_user.items.where(
			:id => params[:item_id],
			:status => 8
		).first
		if @item.order.quantity > 0
			@item.order.quantity = @item.order.quantity - 1
			unless @item.order.valid?
				redirect_to order_path(@item.order)
				return
			end
			@item.order.save
			@item.status = 0
			@item.price = @item.order.price
			@item.expires = DateTime.now + @item.order.ticket_time.to_i.seconds
			@item.save
		end
		redirect_to writer_item_path(@item)
	end

end