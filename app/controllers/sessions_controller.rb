class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to root_path, notice: 'Logged in seccessfully'
    else
      redirect_to root_path, alert: 'Invalid Email or Password'
     
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: 'Signed out seccessfully'
  end
end
