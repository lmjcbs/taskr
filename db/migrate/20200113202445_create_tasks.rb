class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.string :assinged_to
      t.boolean :is_completed, :default => false
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
