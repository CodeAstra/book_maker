class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    deny_access!
  end

private
  def deny_access!
    if request.xhr?
      render 'common/access_denied'
    else
      redirect_to root_path, alert: "Access Denied!"
    end
  end
end
