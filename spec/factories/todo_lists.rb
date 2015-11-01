FactoryGirl.define do
  factory :todo_list do
    name "MyString"
    is_private false
    user
  end
end
