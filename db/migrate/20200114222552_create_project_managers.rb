class CreateProjectManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_managers do |t|
      t.integer :project_id
      t.timestamps
    end
  end
end
