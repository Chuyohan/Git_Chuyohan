class FavoritesController < ApplicationController
	def new
		@favorite = Favorite.new
	end

	def create 
		@club = Club.find(params[:id])
		@favorite = Favorite.new()
		
	end

	def view
	end
end
