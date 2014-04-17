class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  def new
    @task = Task.new 
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)
    @list.tasks.build(task_params)
    @task.list = @list

    if @task.save
      redirect_to @list
    else
      flash[:error] = "Error creating task. Please try again."
      render :new
    end
  end 

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])


    title = @task.title
    if @task.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @list
    else
      flash[:error] = "There was an error deleting the task."
      render :show
    end
  end



  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @task
    else
      flash[:error] = "Error saving task. Please try again."
      render :edit
    end
  end

  def complete
    # params[:list_id] = @list.id
    @list = List.find(params[:list_id])
    params[:task_checkbox].each do |check|
    task_id = check
    t = Task.find_by_id(task_id)
         t.update_attribute(:complete, true)
     end
    redirect_to list_path(@list)

  end  

  private

  def task_params
    params.require(:task).permit(:title, :description, :complete)
  end
end
