class UsersController < ApplicationController

  def index
  end

  def check_register_user
    @check_user = User.find_by_email(params[:email])
    respond_to do |format|
      format.js
    end
  end
end
