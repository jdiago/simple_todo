class ListItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @todo_list = TodoList.find params[:todo_list_id]
    @list_item = @todo_list.list_items.build list_item_params
    @list_item.save
  end

  def destroy
    @list_item = ListItem.find params[:id]
    @list_item.destroy
  end

  private

  def list_item_params
    params.require(:list_item).permit(:name)
  end
end
