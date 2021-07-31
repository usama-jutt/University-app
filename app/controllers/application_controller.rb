class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  helper_method :current_user, :logged_in?
  def current_user
    #Double pipes known as memoization this will only perform query if my @current_user object does not exist. Otherwise it returns @current_user.
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !! current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to logins_path
    end
  end
end
