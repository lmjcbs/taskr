class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  has_many :comments, through: :tasks

  before_save :set_project_manager
  before_action :logged_in?

  private

  def set_project_manager
    self.project_manager = current_user
  end
end