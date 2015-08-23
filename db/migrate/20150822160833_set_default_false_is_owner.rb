class SetDefaultFalseIsOwner < ActiveRecord::Migration
  def up
  	change_column :group_members, :is_owner, :boolean, default: false
  end

  def down
  end
end
