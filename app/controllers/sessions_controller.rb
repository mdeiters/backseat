class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end
  
  def create
    authenticate_with_open_id do |result, identity_url|
      if result.successful? && @current_user = User.find_or_create_by_identity_url(identity_url)
        successful_login
      else
        failed_login(result.message || "Sorry, no user by that identity exists at #{params[:provider]}")
      end
    end
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
  
  private
  def logout!
    flash[:message] = 'Logged out!'
    session[:user_id] = nil
  end
  
  
  def successful_login
    session[:user_id] = @current_user.id
    redirect_to(root_url)
  end

  def failed_login(message)
    flash[:error] = message
    redirect_to(new_session_url)
  end
end