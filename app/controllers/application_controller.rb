class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :post_controller?
  protect_from_forgery with: :exception

  protected
  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end
  # :email, :password, :birth_year, :birth_month, :birth_day, :first_name, :last_name, :first_name_kana, :last_name_kana

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_year, :birth_month, :birth_day, :first_name, :last_name, :first_name_kana, :last_name_kana, :pay_id])
  end
  
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
