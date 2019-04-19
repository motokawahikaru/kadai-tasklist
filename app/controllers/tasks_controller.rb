class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, except: :index

  def index
    if logged_in?
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Taskが正常に投稿されました"
      redirect_to @task
    else
      flash[:danger] = "Taskが正常に投稿されませんでした"
      render :new
    end
  end
    
  def new
    @task = current_user.tasks.build
  end
    
  def edit
  end
    
  def show
  end
    
  def update
    if @task.update(task_params)
      flash[:success] = "Taskが正常に変更されました"
      redirect_to @task
    else
      flash[:danger] = "Taskが正常に変更されませんでした"
      render :edit
    end
  end
    
  def destroy
    @task.delete
        
    flash[:success] = "Taskが正常に削除されました"
    redirect_to tasks_path
  end
    
  private
    
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
    
  def task_params
    params.require(:task).permit(:content, :status)
  end
    
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
