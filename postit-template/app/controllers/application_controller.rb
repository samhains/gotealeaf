class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :log_out, :current_user

  def logged_in?
    session[:user_id] ? true : false
  end

  def log_out
    session[:user_id]  = nil
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
    
  end
  
end
