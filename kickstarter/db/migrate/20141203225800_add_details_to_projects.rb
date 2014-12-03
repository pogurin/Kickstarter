class AddDetailsToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :photo, :string
  	add_column :projects, :owner_id, :integer
  end
end
