class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
