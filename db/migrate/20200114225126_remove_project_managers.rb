class RemoveProjectManagers < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_managers
  end
end
