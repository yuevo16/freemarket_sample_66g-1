class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mercari' && password == '6666'
    end
  end

end
