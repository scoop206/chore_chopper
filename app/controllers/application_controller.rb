# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_family_session, :current_family

  private
  
  def current_family_session
    return @current_family_session if defined?(@current_family_session)
    @current_family_session = FamilySession.find
  end

  def current_family
    return @current_family if defined?(@current_family)
    @current_family = current_family_session && current_family_session.family
  end
  
  def require_family
    unless current_family
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_family_session_url
      return false
    end
  end

  def require_no_family
    if current_family
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
