class AddDetailsToPledges < ActiveRecord::Migration
  def change
  	add_column :pledges, :backer_id, :integer
  	add_column :pledges, :project_id, :integer
  end
end
