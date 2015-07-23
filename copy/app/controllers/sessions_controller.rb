class SessionsController < ApplicationController
  def new
  end

  def create
  	 user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to all_show_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def create_facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to all_show_path
  end

  def destroy
  	log_out
    session[:user_id] = nil
    redirect_to root_path
  end

end
