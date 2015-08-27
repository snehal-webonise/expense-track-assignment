class Group < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :group_members
  has_many :users, through: :group_members
  has_many :expenses

  validates :name, presence: true

  def self.create_group(params, owner)
    grp = Group.new(name: params[:name], description: params[:description])
    if grp.save
      grp.group_members.create(user_id: owner.id, is_owner: true)
      params[:email].each do |email|
        user = User.find_by_email(email)
        grp.group_members.create(user_id: user.id)
      end
    end
    grp
  end
end
