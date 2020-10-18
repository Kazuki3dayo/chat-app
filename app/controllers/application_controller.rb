class ApplicationController < ActionController::Base
  before_action :authenticate_user!   # ログインしていないユーザーがアクションに伴うそ操作をするとログイン画面に飛ばす
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #特定のカラムを許容するメソッド。nameキーの内容をpermitメソッドで許可している。
  end
end
