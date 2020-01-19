class DropUserProjects < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_projects
  end
end
