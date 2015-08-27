class UsersController < ApplicationController

  def index
  end

  def get_registered_users
    @users = User.all
    render :json => { :users => @users.map{|user| user.email}}
  end
end
