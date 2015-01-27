class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email_format:
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
end
