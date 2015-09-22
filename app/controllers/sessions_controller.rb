class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "You've logged in"
      redirect_to choices_path
    else
      flash[:danger] = "Invalid username or password"
      render :new
    end
  end
end
