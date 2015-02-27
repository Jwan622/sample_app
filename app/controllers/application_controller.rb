class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  private

  def logged_in_user
    unless logged_in? #this is just if current_user is not nil. Current_user checks to see if there's a session[:user_id]
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
