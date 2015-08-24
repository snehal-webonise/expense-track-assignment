class ExpensesController < ApplicationController

  def create
    grp = Group.find(params[:group_id])
    @expense = grp.expenses.new(amount: params[:amount],
                                description: params[:description],
                                paid_by: current_user.id)
    @expense.save
  end
end
