class AddDetailsToRewards < ActiveRecord::Migration
  def change
  	add_column :rewards, :project_id, :integer
    add_column :rewards, :name, :string
  end
end
