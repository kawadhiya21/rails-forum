class SessionController < ApplicationController
  before_filter :check_authentication, :except => :create
  include ApplicationHelper
  def create
    user = User.new(params[:user])
    @user = user.authenticate(user.email,user.password)
    if params[:user]
      if @user
        session[:user_id] = @user.id
        @userid = @user
        render "authenticated"      
      else
        @user = User.new
        flash[:notice] = "Sorry the email password combination provided is wrong"
        render "create"
      end
    else
      render "create"
    end  
  end

  def destroy
    @user = current_user
    if @user
      session[:user_id] = nil
      render "destroy"
    end
  end

end
