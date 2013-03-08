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
		begin
		if params[:mailer][:new_item]
			current_admin.notify_new_item = true
		end
		rescue
			current_admin.notify_new_item = false
		end

		current_admin.save
		flash[:notice] = "Ustawienia zostały zaktualizowane"
		redirect_to admin_mail_preferences_path
	end

end