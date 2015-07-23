class StaticPageController < ApplicationController
  def home
  end

  def post
  end

  def create
	  auth = request.env["omniauth.auth"]

	  # Try to find authentication first
	  authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

	  if authentication
	    # Authentication found, sign the user in.
	    flash[:notice] = "Signed in successfully."
	    sign_in_and_redirect(:user, authentication.user)
	  else
	    # Authentication not found, thus a new user.
	    user = User.new
	    user.apply_omniauth(auth)
	    if user.save(:validate => false)
	      flash[:notice] = "Account created and signed in successfully."
	      sign_in_and_redirect(:user, user)
	    else
	      flash[:error] = "Error while creating a user account. Please try again."
	      redirect_to root_url
	    end
	  end
  end

  def apply_omniauth(auth)
  # In previous omniauth, 'user_info' was used in place of 'raw_info'
  self.email = auth['extra']['raw_info']['email']
  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end
end
