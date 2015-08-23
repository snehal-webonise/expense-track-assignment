class GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user.present?
  	  grp = Group.create(name: params[:name], description: params[:description])
  	  grp.group_members.create(user_id: current_user.id, is_owner: true)
      grp.group_members.create(user_id: user.id)
  	else
  	  @msg = 'Email Id is not registered.'
  	end  
  end	

  def details
    @grp = Group.find(params[:id])
    @expenses = @grp.expenses
    @members = @grp.users
  end	
end
