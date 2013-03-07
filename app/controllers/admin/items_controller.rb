class Admin::ItemsController < Admin::AdminController

	def index
		if current_admin.admin?
			if params[:status].nil?
				@items = Item.all
			else
				@items = Item.where( :status => params[:status])
			end
		else
			if params[:status].nil?
				@items = Item.joins(:order).where("orders.admin_id = #{current_admin.id}")
			else
				@items = Item.joins(:order).where("orders.admin_id = #{current_admin.id} and status = #{params[:status]}")
			end
		end
	end

	def show
		@item = Item.find(params[:id])
		unless current_admin.admin?
			if @item.order.admin != current_admin
				raise ActionController::RoutingError.new('Not Found')
			end
		end
	end

	def confirm
		# find item
		@item = Item.where(
			:id => params[:id],
			:status => 5
		).first
		# do not allow access for those customers who dont own this item
		unless current_admin.admin?
			if @item.order.admin != current_admin
				raise ActionController::RoutingError.new('Not Found')
			end
		end
		# set as confirmed and save
		@item.status = 10
		@item.save
		# create balance history record
		@balance_history = BalanceHistory.new
		@balance_history.item = @item
		@balance_history.admin = @item.order.admin
		@balance_history.user = @item.user
		@balance_history.value = (@item.price * -1)
		@balance_history.comment = "Realizacja tekstu do zlecenia ID #{@item.order.id}"
		@balance_history.save
		# save new admin balance
		admin = @balance_history.admin
		admin.balance -= @item.price
		admin.save

		redirect_to admin_item_path(@item)
	end

	def conflict
		@item = Item.where(
			:id => params[:id],
			:status => 5
		).first
		unless current_admin.admin?
			if @item.order.admin != current_admin
				raise ActionController::RoutingError.new('Not Found')
			end
		end
		@conflict = @item.conflicts.new
	end

end