class AdminNotice < ApplicationRecord
  validates :title_notice, length: { in: 1..100 }
  validates :body_notice, length: { in: 1..1000 }
end
