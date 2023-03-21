class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :age, :location, :nationality, :profile_picture, :email, :password, :eat_preference_list => [], :do_preference_list => [])
    end
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
