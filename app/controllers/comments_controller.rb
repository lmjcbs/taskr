class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_task

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment successfully added"
      redirect_to project_task_path(@project, @task)
    else
      flash[:alert] = "Error creating comment"
      redirect_to project_task_path(@project, @task)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = "Comment was successfully deleted."
      redirect_to project_task_path(@project, @task)
    else
      flash[:alert] = "Something went wrong"
      redirect_to project_task_path(@project, @task)
    end
  end

  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
