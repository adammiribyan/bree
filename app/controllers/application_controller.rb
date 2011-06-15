class ApplicationController < ActionController::Base
  # HTTP Authentication
  http_basic_authenticate_with :name => AppConfig[:auth_name], :password => AppConfig[:auth_password]
  
  helper_method :pjax?
  
  protect_from_forgery
  autocomplete :patient, :full_name, :full => true
  
  private

    def handle_pjax
      render :layout => false if pjax?
    end
    
    def pjax?
      request.headers['X-PJAX']
    end
end
