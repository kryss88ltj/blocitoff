class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    @task = Task.new
    #render layout: 'test'      this was for overring the application.html.erb
  end 

  def new
    @list = List.new 
  end

  def create
    @list = List.new(list_params)

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


  private

  def list_params
    params.require(:list).permit(:title)
  end


end
