class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def current_company
    current_user.company if current_user
  end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.is_admin?
  end

end
