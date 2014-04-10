class TasksController < ApplicationController
  def index
    if current_user 
      @tasks = current_user.tasks
    else  
      @tasks = Task.all
    end  
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  # def new
  #   @list = List.find(params[:list_id])
  #   @task = Task.new 
  # end 

  def create
    @list = List.find(params[:list_id])
    @task = current_user.tasks.build(task_params)
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
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @list
    else
      flash[:error] = "Error saving task. Please try again."
      render :edit
    end
  end


  def complete
    @list = List.find(params[:list_id])

    if params[:task_checked] != nil 
      params[:task_checked].each do |check|
        task_id = check
        t = Task.find_by_id(task_id)
        if t.complete == true
          t.update_attribute(:complete, false)
        else 
          t.update_attribute(:complete, true)
        end 
      end

    end


    redirect_to list_path(@list)

  end  

  private

  def task_params
    params.require(:task).permit(:title, :description, :complete)
  end
end
