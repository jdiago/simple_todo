require 'rails_helper'

RSpec.describe 'list items', type: :feature do
  context 'adding list items' do
    context 'with an authenticated user' do
      before do
        @list = create :todo_list
        user = create :user

        visit '/'
        click_on 'Sign in'
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: 'password'
        click_on 'Log in'
      end

      it 'allows the current user to add list items', js: true do
        visit(todo_list_path(@list))
        fill_in 'list_item[name]', with: 'test item 1'
        click_on 'Save List item'
        within('#list_items') do
          expect(page).to have_content('test item 1')
        end
      end
    end
  end
end
