class FavoriteList < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo_list

  validates :todo_list, uniqueness: { scope: :user }
end
