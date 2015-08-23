class ExpensesController < ApplicationController

  def create
  	grp = Group.find(params[:group_id])
  	grp.expenses.create(amount: params[:amount],
  	                    description: params[:description], 
  		                paid_by: current_user.id)
  end
end
