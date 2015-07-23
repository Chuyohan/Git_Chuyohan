


      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      log_in (user)
      redirect_to (root_path)
      redirect_to clubs_path
    else
    end
    if user && user.authenticate(params[:session][:password])
    log_out
    redirect_to clubs_path
    redirect_to root_path
    session[:user_id] = nil
    session[:user_id] = user.id
    user = User.find_by(email: params[:session][:email].downcase)
    user = User.from_omniauth(env["omniauth.auth"])
  def create
  def destroy
  def facebook_create
  end
  end
  end
class SessionsController < ApplicationController
end