class RemoveProjectManagerId < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :project_manager_id
  end
end
