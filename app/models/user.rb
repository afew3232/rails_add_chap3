class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す テスト用のログインデータ(fixtureという)
  # testで使用する
  #password_digestをfixtureに追加する ⇒ digestメゾット
  # has_secure_passwordで bcryptパスワードが作成されるため、同じ方法でfixtureようのパスワードを作成する。
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
