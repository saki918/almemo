class ApplicationController < ActionController::Base
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # CSRF対策(クロスサイトリクエストフォージェリ)
  # サイトに攻撃用のコードを仕込むことで、アクセスしたユーザーに対して意図しない操作を行わせる
  # 攻撃を防ぐ
  protect_from_forgery with: :exception
protected
  def after_sign_in_path_for(resource)
    case resource
    when Guest
      events_path
    when Admin
      admin_guests_path
    end
  end
  def after_sign_out_path_for(resource)
    case resource
    when Guest
      root_path
    when Admin
      new_admin_session_path
    end
  end
end
