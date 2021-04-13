class Post < ApplicationRecord


  belongs_to :customer
  attachment :image 
end
