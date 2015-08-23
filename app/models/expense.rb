class Expense < ActiveRecord::Base
  belongs_to :group
  attr_accessible :amount, :description, :paid_by, :group_id
  
  def self.calculate_share_amt(user,grp)
  	if grp.expenses.where(paid_by: user.id).present? 
      expense = grp.expenses.where(paid_by: user.id).first.amount
      expense.to_i / grp.users.count.to_i
    else
      0  
    end  
  end	
  def self.fetch_contri(user, share_amt, grp)
  	contributor = grp.expenses.where(paid_by: user.id).first
  	if contributor.present?
      user_expense = contributor.amount.to_i/grp.users.count.to_i
      user_expense.to_i - share_amt.to_i
    else
      share_amt * -1  
    end	
  end	
end
