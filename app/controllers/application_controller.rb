class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  autocomplete :patient, :full_name, :full => true
  
  helper_method :pjax?, :signed_in?, :current_user
  
  private
  
    def current_user
      @_current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def signed_in?
      ! current_user.nil?
    end
    
    def authorize
      deny_access("Login first!") unless signed_in?
    end
    
    def deny_access(flash_message = nil)
      flash[:notice] = flash_message if flash_message
      if signed_in?
        redirect_to root_url
      else
        redirect_to sign_in_url
      end
    end
  
    def handle_pjax
      render :layout => false if pjax?
    end
    
    def pjax?
      request.headers['X-PJAX']
    end
end
