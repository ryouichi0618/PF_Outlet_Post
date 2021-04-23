class Post < ApplicationRecord

  belongs_to :customer
  has_many :ansewers, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  validates :title, length: { in: 1..50 }
  validates :body, length: { in: 1..1000 }




  def self.search_for(selected, content, method)
    if selected == "title"
      if method == 'perfect'
        Post.where(title: content)
      elsif method == 'forward'
        Post.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Post.where('title LIKE ?', '%'+content)
      else
        Post.where('title LIKE ?', '%'+content+'%')
      end
    else
      if method == 'perfect'
        Post.where(body: content)
      elsif method == 'forward'
        Post.where('body LIKE ?', content+'%')
      elsif method == 'backward'
        Post.where('body LIKE ?', '%'+content)
      else
        Post.where('body LIKE ?', '%'+content+'%')
      end
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
