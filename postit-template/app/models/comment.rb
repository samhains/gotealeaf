class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: 'User', inverse_of: :comments
  belongs_to :post, inverse_of: :comments
  validates :body, presence: true
end