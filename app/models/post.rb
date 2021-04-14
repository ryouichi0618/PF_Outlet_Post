class Post < ApplicationRecord

  belongs_to :customer
  has_many :ansewers, dependent: :destroy

  attachment :image
end
