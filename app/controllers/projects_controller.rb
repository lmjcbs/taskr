class ProjectsController < ApplicationController
  before_action :logged_in?

  def index
    @projects = current_user.projects
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @project = set_project
    if current_user.is_project_member?(@project)
      render 'show'
    else
      flash[:error] = "You do not have the permissions to view that"
      redirect_to home_path
    end
  end

  def edit
    @project = set_project
    if is_project_manager?(@project)
      render 'edit'
    else
      flash[:error] = "You do not have the permissions to do that"
      redirect_to @project
    end
  end

  def update
    @project = set_project
    if is_project_manager?(@project) && @project.update_attributes(project_params)
      flash[:success] = "Project successfully updated"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @project = set_project
    if is_project_manager?(@project) && @project.destroy
      flash[:success] = "Project was successfully deleted."
      redirect_to home_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @project
    end
  end
  
  private

  def project_params
    params.require(:project).permit(:title, :category, :project_manager)
  end
  
  def set_project
    Project.find_by(id: params[:id])
  end
end