# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'main'
  helper :all # include all helpers, all the time
  helper_method :logged_in?, :current_user
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0b878c08328c84387bb386b4ee16affa'
  
  filter_parameter_logging :password
  
  before_filter :require_login
  

  protected
  def require_login
    redirect_to(new_session_url) unless logged_in?
  end
  
  def logged_in?
    !session[:user_id].blank?
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
end
