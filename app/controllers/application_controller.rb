class ApplicationController < ActionController::Base
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # CSRF対策(クロスサイトリクエストフォージェリ)
  # サイトに攻撃用のコードを仕込むことで、アクセスしたユーザーに対して意図しない操作を行わせる
  # 攻撃を防ぐ
  protect_from_forgery with: :exception
  before_action :event_search
  before_action :member_search

  protected
  def event_search
    @event_search = Event.ransack(params[:q])
    @events = @event_search.result
  end
  def member_search
    @member_search = Member.ransack(params[:q])
    @members = @member_search.result
  end

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
    when :guest
      root_path
    when :admin
      new_admin_session_path
    end
  end
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
#    # sign_upの際にnameのデータ操作を許。追加したカラム。
#  end
end
