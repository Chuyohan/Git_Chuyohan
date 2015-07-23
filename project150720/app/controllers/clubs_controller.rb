class ClubsController < ApplicationController
  def all_show
  	@clubs = Club.all.paginate(page: params[:page])
  end

  def category_show
  end
end
