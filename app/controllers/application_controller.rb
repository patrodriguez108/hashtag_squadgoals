class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @goals_sample = Goal.where(private: false).sample(5)
  end

  def about
  end

 before_action :configure_permitted_parameters, if: :devise_controller?, :only => [:create, :edit]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:profile_pic, :username, :email, :password, :given_name, :family_name)
      end
  end
end
