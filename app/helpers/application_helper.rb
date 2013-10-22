module ApplicationHelper
  def check_authentication
    if session[:user_id].nil?
      redirect_to :root
    end
  end
  def current_user
    user = User.find_by_id(session[:user_id])
    user
  end  
end
