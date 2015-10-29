require 'rails_helper'

RSpec.describe 'the sign up process' do
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
