class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :set_api_key

def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :last_name_kana, :first_name_kana, :nickname])
end

 def authenticate_customer
  unless admin_signed_in?
  redirect_to  new_admin_session_path
  end
 end

 def authenticate_gest
  if current_customer && current_customer.email == 'guest@1111.com'
   redirect_to  root_path
  end
 end

 private
 def set_api_key
  gon.weather_api_key = ENV['WEATHER_API_KEY']
 end
end
