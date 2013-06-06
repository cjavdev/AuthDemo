class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:user][:username])
    
    if user.verify_password(params[:user][:password])
      user.reset_session_token!
      session[:session_token] = user.session_token
      
      redirect_to user_url
    else
      render :json => "Bad dog!"
    end
  end
  
  def destroy
    u = current_user
        
    if u.nil?
      redirect_to new_session_url
      return
    end
      
    session[:session_token] = nil
    u.session_token = nil
    u.save!
  
    redirect_to new_session_url
  end
end
