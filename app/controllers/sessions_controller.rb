# encoding: utf-8

class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create, :destroy, :reset_password]
  protect_from_forgery :except => :create
  
  def new
    render template: "sessions/new"
  end

  def create
    user = User.find_by_username("admin")
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to(root_url, notice: "Logged in!")
    else
      flash.now.alert = "Введите правильный пароль."
      render action: "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_url, notice: "Logged out!")
  end
  
  def reset_password
    user = User.find_by_username("admin")
    
    if password = user.update_password
      UserMailer.new_password(password).deliver
    end
    
    respond_to :js
  end

end
