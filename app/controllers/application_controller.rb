class ApplicationController < ActionController::Base
  処理確認のたびにユーザー/PWを求められるのが面倒なのでBasic認証を一時的にオフ
  before_action :basic_auth
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private

  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :kana_last_name, :kana_first_name, :birth])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'abcd1234'
    end
  end
end
