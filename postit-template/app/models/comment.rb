class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: :User, inverse_of: :comment
  belongs_to :post, inverse_of: :comment
end