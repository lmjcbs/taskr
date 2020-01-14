class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks, through: :projects
  has_many :comments, through: :tasks

  has_secure_password

  def is_project_member?(project)
    self.projects.include?(project)
  end
end