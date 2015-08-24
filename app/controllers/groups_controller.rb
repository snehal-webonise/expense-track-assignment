class GroupsController < ApplicationController

  def create
    params[:mytext].each do |email|
      @err_msg = "#{email} is not registered." unless
        User.find_by_email(email).present?
    end
    return if @err_msg.present?
    group = Group.create_group(params, current_user)
    @err_msg = group.errors.full_messages[0] if
      group.errors.full_messages.present?
  end

  def details
    @grp = Group.find(params[:id])
    @expenses = @grp.expenses
    @members = @grp.users
  end
end
