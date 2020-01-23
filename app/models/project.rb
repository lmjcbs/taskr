class Project < ApplicationRecord
  has_many :project_members
  has_many :users, through: :project_members
  has_many :tasks, dependent: :destroy
  has_many :comments, through: :tasks

  validates :title, presence: :true

  accepts_nested_attributes_for :tasks

  def add_project_member(user)
    self.users << user
  end

  def define_project_manager(user)
    self.users << user
    self.project_members[0].role = "Project Manager"
    self.project_members[0].is_manager = true
  end

  def project_manager
    User.find(self.project_members[0].user_id)
  end
end