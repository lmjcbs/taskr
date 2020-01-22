class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_project_member, only: [:show]
  before_action :authenticate_project_manager, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.define_project_manager(current_user)
    if @project.save
      flash[:notice] = "Project successfully created"
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project was successfully deleted"
      redirect_to projects_path
    else
      flash[:alert] = "Unable to delete project"
      redirect_to @project
    end
  end
  
  private

  def project_params
    params.require(:project).permit(:title)
  end
  
  def set_project
    @project = Project.find(params[:id])
  end

  def authenticate_project_member
    unless @project.users.include?(current_user)
      flash[:alert] = "You do not have the permissions to view that"
      redirect_to projects_path
    end
  end

  def authenticate_project_manager
    unless @project.project_manager == current_user
      flash[:alert] = "You do not have the permissions to do that"
      redirect_to @project
    end
  end
end