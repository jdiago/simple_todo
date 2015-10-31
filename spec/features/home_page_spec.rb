require 'rails_helper'

RSpec.describe 'the home page', type: :feature do
  it 'displays sign in, sign up, and title' do
    visit '/'
    expect(page).to have_content('Simple TODO')
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Sign in')
  end
end
