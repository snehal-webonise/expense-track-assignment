class Expense < ActiveRecord::Base
  belongs_to :group
  attr_accessible :amount, :description, :paid_by, :group_id
  validates :amount, presence: true

  ## If user has contributed in a group then calculating amount which will be
  ## shared by all group members.
  def self.calculate_share_amt(user, grp)
    paid_by_user = grp.expenses.where(paid_by: user.id).first
    return 0 unless paid_by_user.present?
    expense = paid_by_user.amount
    expense.to_f / grp.users.count.to_i
  end

  ## Calcualting owe/owed amount for a member of a group.
  def self.fetch_contri(user, share_amt, grp)
    contributor = grp.expenses.where(paid_by: user.id).first
    if contributor.present?
      user_expense = contributor.amount.to_f / grp.users.count.to_i
      user_expense.to_f - share_amt.to_f
    else
      share_amt * -1
    end
  end
end
