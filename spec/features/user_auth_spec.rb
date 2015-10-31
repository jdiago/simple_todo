require 'rails_helper'

RSpec.describe 'user authentication', type: :feature do
  describe 'the sign up process' do
    it 'signs in the new user' do
      visit '/'
      click_on 'Sign up'
      fill_in 'user[email]', with: 'foo@bar.co'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      within('#new_user') do
        click_on 'Sign up'
      end

      expect(current_path).to eq('/lists')
      expect(page).to have_content('Sign out')
      expect(page).to have_content('New List')
    end
  end

  describe 'the sign in process' do
    it 'signs in an existing user' do
      user = create :user

      visit '/'
      click_on 'Sign in'
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'password'
      click_on 'Log in'

      expect(current_path).to eq('/lists')
      expect(page).to have_content('Sign out')
      expect(page).to have_content('New List')
    end
  end
end
