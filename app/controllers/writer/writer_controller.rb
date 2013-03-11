# encoding: utf-8
class Writer::WriterController < ApplicationController

	before_filter :authenticate_user!

	def settings
		@user = current_user
		@tab = params[:tab]
	end

	def save_mailer_settings
		@user = current_user
		# new order mailer
		begin
			if params[:mailer][:new_order]
				@user.notify_new_order = true
			else
				@user.notify_new_order = false
			end
		rescue
			@user.notify_new_order = false
		end
		# item accept
		begin
			if params[:mailer][:item_accept]
				@user.notify_item_accept = true
			else
				@user.notify_item_accept = false
			end
		rescue
			@user.notify_item_accept = false
		end

		# item reject
		begin
			if params[:mailer][:item_reject]
				@user.notify_item_reject = true
			else
				@user.notify_item_reject = false
			end
		rescue
			@user.notify_item_reject = false
		end

		@user.save
		flash[:notice] = "Ustawienia zostały zapisane"
		redirect_to writer_settings_path({:tab => 'mail'})
	end

	def save_new_password
		@user = current_user
	    if @user.update_attributes(params[:admin])
	      	sign_in @user, :bypass => true
	      	flash[:notice] = "Hasło zostało zmienione"
	      	redirect_to writer_settings_path
	    else
	    	flash[:alert] = "Wystąpił błąd"
	    	render :profile
	    end
	end

end