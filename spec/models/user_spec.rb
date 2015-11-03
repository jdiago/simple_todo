require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:todo_lists) }
  it { should have_many(:favorite_lists) }

  describe '.add_to_fav' do
    it 'creates a favorite list' do
      user = create :user
      list = create :todo_list

      expect{
        user.add_to_fav list: list
      }.to change{ user.favorite_lists.count }.by(1)
    end
  end
end
