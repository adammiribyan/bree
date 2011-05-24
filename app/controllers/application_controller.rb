class ApplicationController < ActionController::Base
  before_filter :authenticate
  
  helper_method :pjax?
  
  protect_from_forgery
  autocomplete :patient, :full_name, :full => true  
  
  private
    def authenticate
      authenticate_or_request_with_http_basic(AppConfig[:site_name_en]) do |user_name, password|
        user_name == AppConfig[:auth_name] && 
        password == AppConfig[:auth_password]
      end
    end
    
    def handle_pjax
      render :layout => false if pjax?
    end
    
    def pjax?
      request.headers['X-PJAX']
    end
end
