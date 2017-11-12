class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?, :only => [:create, :edit]

 def find_requester(requester_id)
 		User.find(requester_id)
 end
 helper_method :find_requester

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:profile_pic, :username, :email, :password, :given_name, :family_name)
      end
  end
end
