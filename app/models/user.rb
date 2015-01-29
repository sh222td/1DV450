class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z]+\z/ }
end
