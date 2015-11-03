class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_lists = current_user.todo_lists
    @my_favs = current_user.favorite_lists.map &:todo_list
    @todo_lists = TodoList.is_public - @my_lists
  end

  def show
    @todo_list = TodoList.includes(:list_items).find(params[:id])
  end

  def new
    @todo_list = current_user.todo_lists.build
  end

  def create
    @todo_list = current_user.todo_lists.build todo_list_params

    if @todo_list.save
      redirect_to @todo_list
    else
      render :new
    end
  end

  def fav
    @todo_list = TodoList.find(params[:id])
    current_user.add_to_fav(list: @todo_list)
    flash.now[:notice] = 'list favorited'
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:name, :is_private)
  end
end
