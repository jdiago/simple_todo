require 'rails_helper'

RSpec.describe 'creating a list', type: :feature do
  context 'with an authenticated user' do
    before do
      user = create :user

      visit '/'
      click_on 'Sign in'
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'password'
      click_on 'Log in'
    end

    it 'allows the current user to create a list' do
      visit '/lists/new'

      expect(page).to have_content('New List')

      fill_in 'todo_list[name]', with: 'test list'
      click_on 'Create Todo list'

      expect(current_path).to eq(todo_list_path(TodoList.last))
      expect(page).to have_content('test list')
    end
  end

  context 'with no authenticated user' do
    it 'asks for a user to sign in' do
      visit '/lists/new'
      expect(current_path).to eq('/sign-in')
    end
  end
end
