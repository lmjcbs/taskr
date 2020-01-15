class AddProjectsManagersId < ActiveRecord::Migration[6.0]
  def change
    remove_column :project_managers, :project_id
    add_column :projects, :project_manager_id, :integer
  end
end
