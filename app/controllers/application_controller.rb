class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar, :job)
    end


    private
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  # def after_sign_up_path_for(resource)
  #   # new_user_session_path
  #   success_articles_path
  #   # '/articles/success'
  # end

end


