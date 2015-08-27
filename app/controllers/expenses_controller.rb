class ExpensesController < ApplicationController

  def create
    grp = Group.find(params[:group_id])
    @expense = grp.expenses.new(amount: params[:amount],
                                description: params[:description],
                                paid_by: current_user.id)
    if @expense.save
    	redirect_to users_path
    else
    	@err_msg = @expense.errors.full_messages[0]
    	render :action => 'new'
    end 	
  end
end
