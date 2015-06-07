class Category < ActiveRecord::Base
  has_many :posts, through: :post_category
end: