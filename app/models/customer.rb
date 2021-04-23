class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :ansewers, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :info, length: { maximum: 100 }
  validates :nickname, length: { in: 1..10 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  # コールバック時に呼び出されるメソッド
  def self.find_for_oauth(auth)
    customer = Customer.where(uid: auth.uid, provider: auth.provider).first

    customer ||= Customer.create(
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      first_name_kana: "未記入(姓)",
      last_name_kana: "未記入(名)",
      nickname: auth.info.name,
      uid: auth.uid,
      provider: auth.provider,
      # メールアドレス認証もしている為何かしら値が無くてはいけないので仮の値を代入
      email: Customer.dummy_email(auth),
      # ランダムに決まった数字20桁のパスワードを生成
      password: Devise.friendly_token[0, 20]
    )

    customer
  end

  # 会員検索機能
  def self.search_for(selected, content, method)
    if selected == "nickname"
      if method == 'perfect'
        Customer.where(nickname: content)
      elsif method == 'forward'
        Customer.where('nickname LIKE ?', content + '%')
      elsif method == 'backward'
        Customer.where('nickname LIKE ?', '%' + content)
      else
        Customer.where('nickname LIKE ?', '%' + content + '%')
      end
    else
      if method == 'perfect'
        Customer.where(info: content)
      elsif method == 'forward'
        Customer.where('info LIKE ?', content + '%')
      elsif method == 'backward'
        Customer.where('info LIKE ?', '%' + content)
      else
        Customer.where('info LIKE ?', '%' + content + '%')
      end
    end
  end

  # 会員退会処理
  def active_for_authentication?
    super && (is_delete == false)
  end

  # 会員退会、復旧のステータス
  def customer_status_by?(customer)
    Customer.where(id: customer.id, is_delete: true).exists?
  end

  def self.dummy_email(auth)
    # uidとproviderの組み合わせが一意な為こちらを利用
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
