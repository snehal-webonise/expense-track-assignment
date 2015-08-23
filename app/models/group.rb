class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :group_members
  has_many :users, through: :group_members
  has_many :expenses
end
