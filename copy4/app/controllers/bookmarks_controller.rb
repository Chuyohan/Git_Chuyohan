class BookmarksController < ApplicationController
	def create
		@bookmarks = current_user.bookmarks.create(params[:user_id])
	end
end
