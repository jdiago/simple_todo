class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todo_lists
  has_many :favorite_lists

  def add_to_fav(list:)
    FavoriteList.create!(user: self, todo_list: list)
  end
end
