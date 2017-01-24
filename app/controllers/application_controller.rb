class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :logged_in?

  def logged_in?
    session[:login]
  end

  private
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      #flash[:danger] = "Please log in."
      redirect_to signup_path
    end
  end

  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      username == "lcbcdigital" && password == "G0F1$H"
    end
    session[:login] = login
  end

  def do_logout
    session[:login] = nil
  end
end
