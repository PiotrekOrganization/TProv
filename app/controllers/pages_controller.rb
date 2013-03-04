class PagesController < ApplicationController

	def show
		unless params[:id].nil?
			@page = Page.find(params[:id])
		else
			@page = Page.where(:slug => params[:slug]).first
		end
	end
	
end