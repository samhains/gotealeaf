class User < ActiveRecord::Base
  has_many :posts do
    def find_by_category
      puts self
    end 
    
  end
  has_many :comments

end