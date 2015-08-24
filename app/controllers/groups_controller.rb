class GroupsController < ApplicationController

  def create
    params[:emails].each do |email|
      @err_msg = User.validate_email(email)
    end
    return if @err_msg.present?
    group = Group.create_group(params, current_user)
    @err_msg = group.errors.full_messages[0] if
      group.errors.full_messages.present?
  end

  ## Show details of each group.
  def details
    @grp = Group.find(params[:id])
    @expenses = @grp.expenses
    @members = @grp.users
  end
end
