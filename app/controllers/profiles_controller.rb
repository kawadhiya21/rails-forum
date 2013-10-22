class ProfilesController < ApplicationController
  before_filter :check_authentication
  include ApplicationHelper
  
  def edit
    user = current_user
    @profile = Profile.find_or_create_by_user_id(user.id)
    if params[:profile]
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Your profile has been updated.'
      else
        flash[:notice] = 'Your profile could not be updated'
      end
      render "edit"
    else
      render "edit"
    end    
  end
end
