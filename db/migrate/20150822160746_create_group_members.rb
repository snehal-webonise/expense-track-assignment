class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :is_owner

      t.timestamps
    end
  end
end
