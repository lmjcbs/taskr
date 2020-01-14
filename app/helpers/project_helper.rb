module ProjectHelper
  def set_project_member(user, project)
    user.projects << project
  end

  def set_project_manager(user, project)
    project.project_manager_id = user.id
    set_project_member(user, project)
  end
end