class Post < ApplicationRecord

  belongs_to :customer
  has_many :ansewers

  attachment :image
end
