# encoding: utf-8
class Admin::AdminController < ApplicationController

	layout 'admin'
	before_filter :authenticate_admin!

	def profile
		@admin = current_admin
	end

	def update_password
		@admin = current_admin
	    if @admin.update_attributes(params[:admin])
	      	sign_in @admin, :bypass => true
	      	redirect_to admin_profile_path
	    else
	    	flash[:alert] = "Wystąpił błąd"
	    	render :profile
	    end
	end

	def mail_settings

	end

	def save_mail_settings

	end

end