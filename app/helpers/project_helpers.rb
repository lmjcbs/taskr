module ProjectHelper
  def is_project_manager?(project)
    project.project_manager == current_user
  end
end