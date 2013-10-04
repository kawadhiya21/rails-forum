class DashboardController < ApplicationController
  before_filter :check_authentication  
  def index
    @categories = Category.all
    @posts = Post.all
  end
end
