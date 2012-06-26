class SessionsController < ApplicationController
	def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' 	# flash.now is specifically designed for displaying flash messages on rendered pages
      																													#; unlike the contents of flash, its contents disappear as soon as there is an additional request.
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
