class ClubsController < ApplicationController
  def new
  	@club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
       flash.now[:success] = "Create the club!"
      redirect_to all_show_path
    else
      render 'new'
    end
  end

  def edit
  	@club = Club.find(params[:id])
  end

  def update
  	@club = Club.find_by(params[:name])
  	if @club.update_attributes(club_params)
  		flash[:success] = "Club Post Eidt Success"
  		redirect_to all_show_path
  	else
  		render 'edit'
  	end
  end
 
  def view
  	@club = Club.find(params[:id])
  end 

  def delete
  	Club.find(params[:id]).destroy
  	flash[:success] = "Club deleted"
  	redirect_to all_show_path
  end

  def all_show
  	@clubs = Club.all.paginate(page: params[:page], :per_page => 9)
  end

  def category_show
  end

  private
    def club_params
      params.require(:club).permit(:name, :category, :intro, :location, :personnel, :history, :phone, :picture)
  	end
end

