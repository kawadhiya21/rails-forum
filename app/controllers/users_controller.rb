class UsersController < ApplicationController
  def new
    @user = User.new(params[:user])
    if params[:user]
      if @user.save
        flash[:notice] = "You signed up successfully"
        flash[:color]  = "valid"
      else
        flash[:notice] = "Form is invalid"
        flash[:color]  = "invalid"
      end  
    end
      render "new"
  end
end
