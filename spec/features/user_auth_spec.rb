require 'rails_helper'

RSpec.describe 'user authentication' do
  describe 'the sign up process' do
    it 'signs in the new user' do
      visit '/'
      click_on 'Sign up'
      fill_in 'user[email]', with: 'foo@bar.co'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Sign up'
      expect(current_path).to eq('/')
      expect(page).to have_content('Sign out')
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
      expect(current_path).to eq('/')
      expect(page).to have_content('Sign out')
    end
  end
end
