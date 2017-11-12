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

 # before_action :configure_permitted_parameters, if: :devise_controller?, :only => [:create, :edit]

 #  protected

 #    def configure_permitted_parameters
 #      devise_parameter_sanitizer.permit(:sign_up) do |user|
 #        user.permit(:profile_pic, :username, :email, :password, :given_name, :family_name)
 #      end
 #  end
end
