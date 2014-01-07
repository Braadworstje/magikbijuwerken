
class SessionsController < ApplicationController
  def new
  end

  def destroy
    sign_out
    flash[:notice] = "You are now signed out!"
    redirect_to root_url
  end


  def create
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      # sign in
      session[:user_id] = user.id
      flash[:notice] = "You are signed in!"
      redirect_to current_user
    else
      flash.now[:alert] = "You have an invalid password or email adress!"
      render 'new'

    end
  end
end
