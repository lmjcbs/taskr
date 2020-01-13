class ProjectsController < ApplicationController
  before_action :logged_in?

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully created"
      redirect_to project_path(@project)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @project = set_project
  end

  def edit
    @project = set_project
  end

  def update
    @project = set_project
    if @project.update_attributes(project_params)
      flash[:success] = "Project successfully updated"
      redirect_to project_path(@project)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @project = set_project
    if @project.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to home_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to home_path
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