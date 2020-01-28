class Project < ApplicationRecord
  has_many :project_members
  has_many :users, through: :project_members
  has_many :tasks, dependent: :destroy
  has_many :comments, through: :tasks

  accepts_nested_attributes_for :project_members

  validates :title, presence: :true

  #returns projects filtered by title and created by the current_user
  scope :search, -> (search, user) {where("title LIKE ? AND project_manager_id IS ?", search, user.id)}

  def add_project_member(user, role)
    self.users << user
    self.project_members.last.role = role
  end

  def define_project_manager(user)
    self.users << user
    self.project_manager_id = user.id
    self.project_members[0].role = "Project Manager"
    self.project_members[0].is_manager = true
  end

  def project_manager
    User.find(self.project_members[0].user_id)
  end
end