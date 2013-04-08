# encoding: utf-8
class Admin::AdminsController < Admin::AdminController

	before_filter :super_admin

	def super_admin
		unless current_admin.admin?
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	def customers
		@customers = Admin.all
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(params[:admin])
		if @admin.save
			flash[:notice] = "Konto zostało utworzone"
			redirect_to admin_customers_path
		else
			flash[:alert] = @admin.errors.messages.inspect
			render :new
		end
	end

end