class Admin::ItemsController < Admin::AdminController

	def index
		if params[:status].nil?
			@items = Item.all
		else
			@items = Item.where(:status => params[:status])
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def confirm
		@item = Item.where(
			:id => params[:id],
			:status => 5
		).first
		@item.status = 10
		@item.save
		render :show
	end

end