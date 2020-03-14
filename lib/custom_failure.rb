# frozen_string_literal: true

class CustomFailure < Devise::FailureApp
  # def redirect_url
  #   new_guest_session_url(subdomain: 'secure')
  # end
  def respond
    flash[:notice] = 'セッションが切れました。再度ログインしてください。'
    flash.keep(:notice)
    p flash
    redirect_to new_guest_session_url(subdomain: 'secure')
  end
end
