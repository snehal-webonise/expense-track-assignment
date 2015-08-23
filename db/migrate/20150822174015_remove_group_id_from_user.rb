class RemoveGroupIdFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :group_id
  end

  def down
  end
end
