class TasksController < ApplicationController
  before_action :set_user
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :user_created_task?, only: [:edit, :update, :destroy]

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.user = @user
    if @task.save
      flash[:success] =  "Task successfully created"
      redirect_to project_task_path(@project, @task)
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
    if @task.update(task_params)
      flash[:success] = "Task successfully updated"
      redirect_to project_task_path(@project, @task)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully deleted."
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      redirect_to project_task_path(@project, @task)
    end
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :assigned_to, :category_id)
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end
  
  def user_created_task?
    unless @task.user == @user
      flash[:error] = "You do not have the permissions to do that"
      redirect_to @project
    end
  end
end