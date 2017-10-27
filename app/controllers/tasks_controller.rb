class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @taks = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_tp @message
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  #Strong paramater
  def task_params
    params.require(:task).permit(:content)
  end
end