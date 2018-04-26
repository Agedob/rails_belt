class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  
  has_many :ideas
  has_many :likes, dependent: :delete_all
  has_many :ideas_liked, through: :likes, source: :idea
end
