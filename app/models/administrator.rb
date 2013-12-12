class Administrator < ActiveRecord::Base
  before_create :create_remember_token

  validate :username, presence: true,
           length: { maximum: 50 },
           uniqueness: { case_sensitive: false } #大小写的用户名是同一个用户名

  has_secure_password
  validates :password, length: { minimum: 6 }

  def Administrator.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Administrator.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Administrator.encrypt(Administrator.new_remember_token)
    end
end
