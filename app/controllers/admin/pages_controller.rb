# encoding: utf-8
class Admin::PagesController < Admin::AdminController

	before_filter :super_admin

	def super_admin
		unless current_admin.admin?
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	def index
		@pages = Page.all
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(params[:page])
			redirect_to admin_pages_path
		else
			flash[:alert] = 'Wystąpił błąd'
			render :edit
		end
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(params[:page])
		if @page.valid?
			@page.save
			redirect_to admin_pages_path
		else
			render :new
		end
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		flash[:notice] = 'Strona usunięta'
		redirect_to admin_pages_path
	end

end