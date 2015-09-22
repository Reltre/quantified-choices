class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_choice

  def current_choice
    if session[:choice_id]
      @choice ||= current_user.choices.where(id: session[:choice_id])[0]
    end
  end

  def empty_page?
    !current_choice
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
