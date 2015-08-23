class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :group

      t.timestamps
    end
    add_index :users, :group_id
  end
end
