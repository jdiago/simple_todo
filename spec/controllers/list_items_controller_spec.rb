require 'rails_helper'

RSpec.describe ListItemsController, type: :controller do
  context 'with an authenticated user' do
    before do
      @list = create :todo_list
      @user = create :user
      sign_in @user
    end

    describe 'POST create' do
      it 'creates a list item' do
        expect{
          xhr :post, :create, todo_list_id: @list.id, list_item: { name: 'test item 1' }
        }.to change{ ListItem.count }.by(1)
      end
    end

    describe 'DELETE destroy'
  end
end
