class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, inverse_of: :creator
  has_secure_password validations: false
  validates :username, presence: true, length: {minimum:5}, uniqueness: true
  validates :password, presence: true, length: {minimum:5}
end