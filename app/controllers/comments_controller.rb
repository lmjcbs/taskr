class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_project
  before_action :set_task
  before_action :set_comment, only: :destroy

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = @user
    if @comment.save
      flash[:notice] = "Comment successfully added"
      redirect_to project_task_path(@project, @task)
    else
      flash[:alert] = "Error creating comment: #{@comment.errors}"
      redirect_to project_task_path(@project, @task)
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Comment was successfully deleted."
      redirect_to project_task_path(@project, @task)
    else
      flash[:alert] = "Something went wrong"
      redirect_to project_task_path(@project, @task)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end
