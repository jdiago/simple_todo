require 'rails_helper'

RSpec.describe 'fav todo list', type: :feature do
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

    it 'allows the current user to favorite a todo list', js: true do
      visit todo_list_path(@list)
      click_on 'favorite'
      expect(page).to have_content('list favorited')
    end
  end
end
