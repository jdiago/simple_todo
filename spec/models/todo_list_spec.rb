require 'rails_helper'

RSpec.describe TodoList, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:list_items) }
  it { should validate_presence_of(:name) }

  describe '.is_public' do
    it 'returns only public lists' do
      pub = create :todo_list
      other = create :todo_list, is_private: true
      public_lists = TodoList.is_public
      expect(public_lists).to eq([pub])
    end
  end
end
