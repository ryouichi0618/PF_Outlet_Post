class Reaction < ApplicationRecord
  
  belongs_to :customer
  belongs_to :ansewer
  has_many :reactions, dependent: :destroy
end
