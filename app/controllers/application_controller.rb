class ApplicationController < ActionController::Base

  add_flash_types :success, :info, :warning, :danger
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :login_required
  include SessionHelper


  private

    def login_required
      redirect_to login_url unless current_user
    end

end
