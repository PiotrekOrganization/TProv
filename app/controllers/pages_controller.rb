class PagesController < ApplicationController

	##
	# Wyświetlanie stron informacyjnych
	# Działa zarówno jeśli podamy params[:id] - ID strony
	# jak i params[:slug] - przyjazny odnośnik
	def show
		unless params[:id].nil?
			@page = Page.find(params[:id])
		else			
			@page = Page.where(:slug => params[:slug]).first
			if(@page.nil?)
				raise ActionController::RoutingError.new("Not Found")
			end
		end
	end
	
end