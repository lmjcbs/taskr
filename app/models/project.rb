class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, dependent: :destroy
  has_many :categories, through: :tasks
  has_many :comments, through: :tasks

  def add_project_manager(user)
    self.project_manager_id = user.id
    user.projects << self
  end

  def project_manager
    User.find(self.project_manager_id)
  end
end