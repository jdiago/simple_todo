class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_lists = current_user.todo_lists
    @todo_lists = TodoList.is_public - @my_lists
  end

  def show
    @todo_list = TodoList.includes(:list_items).find(params[:id])
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new todo_list_params

    if @todo_list.save
      redirect_to @todo_list
    else
      render :new
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:name)
  end
end
