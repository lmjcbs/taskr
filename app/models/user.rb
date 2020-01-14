class User < ApplicationRecord
  has_secure_password

  def is_project_member?(project)
    self.projects.include?(project)
  end
end