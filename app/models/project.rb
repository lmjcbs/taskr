class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, dependent: :destroy
  has_many :categories, through: :tasks
  has_many :comments, through: :tasks
end