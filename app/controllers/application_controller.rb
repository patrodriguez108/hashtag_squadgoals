class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

   before_action :configure_permitted_parameters, :only => [:create, :edit]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:username, :email, :password, :given_name, :family_name)
      end
  end
end
