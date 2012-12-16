# encoding: utf-8
class Admin::ConflictsController < Admin::AdminController

	def create
		@conflict = Conflict.new(params[:conflict])
		@conflict.admin_id = current_admin.id
		if @conflict.valid? and @conflict.item.status == 5
			@conflict.save
			@conflict.item.status = 3
			@conflict.item.save
		else
			flash[:alert] = 'Wystąpił błąd'
		end
		redirect_to admin_item_path(@conflict.item)
	end

end