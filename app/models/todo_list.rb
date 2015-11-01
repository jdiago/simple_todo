class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :list_items

  validates :name, presence: true
end
