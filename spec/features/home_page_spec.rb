require 'rails_helper'

RSpec.describe 'the home page' do
  it 'loads' do
    visit '/'
    expect(page).to have_content 'Simple TODO'
  end
end
