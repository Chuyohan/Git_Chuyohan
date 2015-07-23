class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in (user)
      redirect_to clubs_path
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to (root_path)
    end

  end

  def facebook_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to clubs_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
