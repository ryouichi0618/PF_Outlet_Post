class Ansewer < ApplicationRecord

  belongs_to :customer
  belongs_to :post
  # has_many :reactions, dependent: :destroy
  
  belongs_to :parent,  class_name: "Ansewer", optional: true
  has_many   :replies, class_name: "Ansewer", foreign_key: :parent_id, dependent: :destroy
end
