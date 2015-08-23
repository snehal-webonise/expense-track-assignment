class GroupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  attr_accessible :group_id, :is_owner, :user_id
end
