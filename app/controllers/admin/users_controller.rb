class Admin::UsersController < Admin::AdminController
	
	before_filter :super_admin

	def super_admin
		unless current_admin.admin?
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	def index
		@users = User.all
	end

end