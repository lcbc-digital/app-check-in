class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect to the user's show page.
  		log_in(user)
  		remember user # this calls the remember in sessions_helper.rb
  		#params[:session][:remember_me] == '1' ? remember(user) : forget(user) ### Not doing this in mobile app
  		redirect_to user #rails converts this to user_url(user)
  	else
  		# Create an error message
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
