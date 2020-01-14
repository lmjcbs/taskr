class ChangeProjectManagerColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :project_manager
    add_column :projects, :project_manager_id, :integer
  end
end
