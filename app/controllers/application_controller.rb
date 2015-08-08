class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_choice

  def current_choice
    @current_choice = Choice.find(session[:choice_id]) if session[:choice_id]
  end

  def empty_page?
    !current_choice
  end
end
