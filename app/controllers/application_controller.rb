class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @goals_sample = Goal.where(private: false).sample(5)
  end

  def about
  end



 def find_requester(requester_id)
 		User.find(requester_id)
 end
 helper_method :find_requester

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def logged_in?
    session[:user_id] != nil
  end
  helper_method :logged_in?

  def is_profile_owner?(user)
    current_user.username == user.username
  end
  helper_method :is_profile_owner?
end
