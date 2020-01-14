class FixAssignedToColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :assinged_to, :assigned_to
  end
end
