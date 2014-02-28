# Base controller in rails
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Override because we only support Google OAuth
  def after_sign_in_path_for(resource)
    '/ledger_imports'
  end

  # Override because we only support Google OAuth
  def after_sign_out_path_for(resource)
    '/users/auth/google_oauth2'
  end
end
