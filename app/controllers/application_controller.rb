class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
    before_action :authenticate_user!

    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found()
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password)}
    end

end
