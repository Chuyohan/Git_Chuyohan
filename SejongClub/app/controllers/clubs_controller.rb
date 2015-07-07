class ClubsController < ApplicationController
  def posts
    @posts = Post.all
  end

  def posts_category
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
    @posts = Post.where(category: @category)
  end

  def detail_posts
    @posts = Post.find(params[:id])
  end

end