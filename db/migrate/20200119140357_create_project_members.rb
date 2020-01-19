class CreateProjectMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_members do |t|
      t.string :role
      t.boolean :is_manager, :default => false
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
