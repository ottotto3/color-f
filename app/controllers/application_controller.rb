class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      root_path
    else
      root_path
    end 
  end
  
  helper_method :logged_in?

  private

  def logged_in?
    session[:user_id].present?
  end
end
