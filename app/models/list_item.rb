class ListItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :name, presence: true
end
