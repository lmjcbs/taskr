class ProjectsController < ApplicationController
  include ProjectHelper

  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :project_member?, only: [:show]
  before_action :project_manager?, only: [:edit, :update, :destroy]

  def index
    @projects = @user.projects
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    set_project_manager(@user, @project)
    if @project.save
      flash[:success] = "Project successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project successfully updated"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = "Project was successfully deleted."
      redirect_to home_path
    else
      flash[:error] = "Something went wrong"
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

  def project_member?
    unless @project.users.include?(@user)
      flash[:error] = "You do not have the permissions to view that"
      redirect_to home_path
    end
  end

  def project_manager?
    unless @project.project_manager == @user
      flash[:error] = "You do not have the permissions to do that"
      redirect_to @project
    end
  end
end