class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :age, :location, :bio, :profile_picture, :eat_preference_list, :do_preference_list, :email, :password)}
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end
end
