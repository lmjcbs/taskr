class ChangeUsernameColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :username
    remove_column :users, :name
  end
end
