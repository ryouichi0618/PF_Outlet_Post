class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :ansewers, dependent: :destroy
  # has_many :reactions, dependent: :destroy

  attachment :profile_image




  # コールバック時に呼び出されるメソッド
  def self.find_for_oauth(auth)
    customer = Customer.where(uid: auth.uid, provider: auth.provider).first

    unless customer
      customer = Customer.create(
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        nickname: auth.info.name,
        uid: auth.uid,
        provider: auth.provider,
        # メールアドレス認証もしている為何かしら値が無くてはいけないので仮の値を代入
        email: Customer.dummy_email(auth),
        # ランダムに決まった数字20桁のパスワードを生成
        password: Devise.friendly_token[0, 20]
      )
    end

    return customer
  end

  private

  def self.dummy_email(auth)
    # uidとproviderの組み合わせが一意な為こちらを利用
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
