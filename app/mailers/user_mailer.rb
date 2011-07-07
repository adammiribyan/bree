# encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: "no-reply@adammiribyan.com"
  
  def new_password(password)
    @password = password    
    mail(:to => AppConfig[:admin_email], :subject => "#{AppConfig[:site_name]}: запрос пароля")
  end
end
