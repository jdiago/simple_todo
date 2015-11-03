require 'rails_helper'

RSpec.describe TodoListsController, type: :controller do
  context 'with an authenticated user' do
    before do
      @user = create :user
      sign_in @user
    end

    describe 'GET index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'returns lists' do
        get :index
        expect(assigns[:my_lists]).to_not be_nil
        expect(assigns[:my_favs]).to_not be_nil
        expect(assigns[:todo_lists]).to_not be_nil
      end
    end

    describe 'GET show' do
      before do
        @list = create :todo_list
      end

      it 'returns http success' do
        get :show, id: @list.id
        expect(response).to have_http_status(:success)
      end

      it 'assigns a todo list' do
        get :show, id: @list.id
        expect(assigns[:todo_list]).to_not be_nil
      end
    end

    describe 'GET new' do
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'assigns a new todo list' do
        get :new
        expect(assigns[:todo_list]).to be_a TodoList
      end
    end

    describe 'POST create' do
      it 'creates a todo list and redirects to index' do
        expect{
          post :create, todo_list: { name: 'list name' }
        }.to change{TodoList.count}.by(1)

        expect(response).to redirect_to(todo_list_path(TodoList.last))
      end

      it 'does not create a todo list if name is blank' do
        expect{
          post :create, todo_list: { name: '' }
        }.to change{TodoList.count}.by(0)

        expect(response).to render_template(:new)
      end
    end

    describe 'POST fav' do
      it 'returns http success' do
        list = create :todo_list
        xhr :post, :fav, id: list.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
