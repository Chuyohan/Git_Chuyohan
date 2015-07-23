class ClubsController < ApplicationController
  def club_application
  end

  def club_create
  end

  def clubs
  	@clubs = Club.all.paginate(page: params[:page],  per_page: 9)
  end

  def clubs_category
  	case params[:category]
      when "play"
        @category = "연극"
      when "culture"
        @category = "문화"
      when "sports"
        @category = "체육"
      when "study"
        @category = "학술"
      when "helper"
        @category = "봉사"
      when "religion"
        @category = "종교"
    end
    @clubs = Club.where(category: @category).paginate(page: params[:page], per_page: 9)
  end

  def club_view
  	@clubs = Club.find_by(params[:id])
  end
end
