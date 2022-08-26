class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, 
    if: Proc.new { |c| c.request.format =~ %r{application/json} }


  def after_sign_out_path_for(resource)
    request.referrer
  end
  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end
end
