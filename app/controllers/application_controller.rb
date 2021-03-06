class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def check_authentication
    if session[:user_id].nil?
      redirect_to :root
    end
  end

  def get_current_user
    user = User.find_by_id(session[:user])
    user
  end

  def get_profile
    check_authentication
    profile = Profile.find_by_user_id(session[:user_id])
    profile
  end  
end  
