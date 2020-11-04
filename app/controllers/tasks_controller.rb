class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編輯成功"
    else
      render :edit
    end
  end

  def destroy
    redirect_to tasks_path, notice: "刪除成功" if @task.destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
