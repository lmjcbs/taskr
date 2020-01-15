class ProjectsController < ApplicationController
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_tasks, only: :show
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
    @project.add_project_manager(@user)
    if @project.save
      flash[:notice] = "Project successfully created"
      redirect_to @project
    else
      flash[:alert] = "Something went wrong"
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
      flash[:alert] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project was successfully deleted."
      redirect_to home_path
    else
      flash[:alert] = "Something went wrong"
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

  def set_project_tasks
    @tasks = @project.tasks
  end

  def project_member?
    unless @project.users.include?(@user)
      flash[:alert] = "You do not have the permissions to view that"
      redirect_to home_path
    end
  end

  def project_manager?
    unless @project.project_manager == @user
      flash[:alert] = "You do not have the permissions to do that"
      redirect_to @project
    end
  end
end