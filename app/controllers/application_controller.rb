class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  before_action :authenticate_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to new_session_path, alert: 'Please signup or login to continue' unless logged_in?
  end
end
