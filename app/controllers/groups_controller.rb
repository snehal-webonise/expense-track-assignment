class GroupsController < ApplicationController

  def new
  end  

  def create
    params[:email].each do |email|
      @err_msg = User.validate_email(email)
    end
    render :action => 'new' and return if @err_msg.present?
    group = Group.create_group(params, current_user)
    if group.errors.full_messages.present?
      @err_msg = group.errors.full_messages[0] 
      render :action => 'new'
    else
      redirect_to users_path
    end  
      
  end

  ## Show details of each group.
  def details
    @grp = Group.find(params[:id])
    @expenses = @grp.expenses
    @members = @grp.users
  end
end
