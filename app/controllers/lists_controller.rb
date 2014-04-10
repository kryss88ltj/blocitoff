class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
      # @user = User.find_by_email("christine.stauffer@gmail.com")
      @list = current_user.lists.find(params[:id])
      @tasks = @list.tasks
      @task = Task.new
  end 

  def new
    @list = List.new 
    @task = Task.new
  end

  def create

    @list = current_user.lists.build(list_params)

    if @list.save
      flash[:notice] = "List was saved successfully."
      redirect_to @list
    else
      flash[:error] = "Error creating list. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      redirect_to @list
    else
      flash[:error] = "Error saving list. Please try again."
      render :edit
    end
  end



 # def destroy
 #    @list = List.find(params[:topic_id])
 #    @task = Task.find(params[:id])


 #    title = @task.title
 #    if @task.destroy
 #      flash[:notice] = "\"#{title}\" was deleted successfully."
 #      redirect_to @list
 #    else
 #      flash[:error] = "There was an error deleting the task."
 #      render :show
 #    end
 #  end



  private

  def list_params
    params.require(:list).permit(:title)
  end


end
