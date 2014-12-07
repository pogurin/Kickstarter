class RemoveUserIdFromPledges < ActiveRecord::Migration
  def change
    remove_column :pledges, :user_id, :integer
  end
end
