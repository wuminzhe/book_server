class User < ActiveRecord::Base
  before_create :create_remember_token

  validate :username, presence: true,
           length: { maximum: 50 },
           uniqueness: { case_sensitive: false } #大小写的用户名是同一个用户名

  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
