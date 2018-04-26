class Idea < ActiveRecord::Base
  has_many :likes
  has_many :likes, dependent: :delete_all
  has_many :users_liked, through: :likes, source: :user
  belongs_to :user
end
