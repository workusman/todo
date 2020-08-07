class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_list
  before_action :load_task, only: %i[show edit update destroy ]

  def index
    @tasks = @list.tasks
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new task_params
    if @task.save!
      flash[:message] = "Task successfully created"
      redirect_to list_tasks_path(@list)
    else
      flash[:error] = "Unable to create task"
    end
  end

  def show
  end

  def filtered_tasks
    @tasks = params[:type] == "complete" ? @list.tasks.complete : @list.tasks.incomplete
    respond_to do |format|
      format.js
    end
  end

  def update
    @task.update(completed_at: @task.completed_at.nil? ? Time.zone.now : nil )
    redirect_to list_tasks_path(@list)
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list)
  end

  private

  def load_list
    @list = current_user.lists.find params[:list_id]
  end

  def load_task
    @task = @list.tasks.find params[:id]
  end


  def task_params
    params.require(:task).permit(:title, :status)
  end
end
