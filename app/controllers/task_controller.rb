class TaskController < ApplicationController

  def destroy
    @task = Task.find(params[:id])


    title = @task.title
    if @task.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to tasks_path
    else
      flash[:error] = "There was an error deleting the task."
      render :show
    end
  end

end
