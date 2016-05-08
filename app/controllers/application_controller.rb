class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def after_sign_in_path_for(resource)
    if resource.is_a? User
      user_path(current_user) #your path
    elsif resource.is_a? Admin
      admin_path(current_admin) #your path
    end
  end
end
