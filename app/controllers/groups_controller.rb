class GroupsController < ApplicationController

  def new
  end

  def create
    emails = params[:email][0].split(',').map(&:strip)
    emails.uniq!
    emails.pop
    @err_msg  = User.validate_email(emails, current_user)
    render :action => 'new' and return if @err_msg.present?
    group = Group.create_group(params, current_user, emails)
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
