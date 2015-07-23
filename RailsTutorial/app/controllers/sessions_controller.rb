class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in (user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
      #여기에서 flash.now하면 안되고 flash만 해야한다. 이유는 모름.(궁금)
      flash[:success] = "Hellow!! #{user.name}"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end