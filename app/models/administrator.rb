class Administrator < ActiveRecord::Base
  belongs_to :school
  has_many :administrator_role_associations
  has_many :roles, through: :administrator_role_associations
  
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

  def typo_name
    if self.typo == 0
      return '管理员'
    elsif self.typo == 1
      return '学校管理员'
    else
      return '管理员'
    end
  end

  private

    def create_remember_token
      self.remember_token = Administrator.encrypt(Administrator.new_remember_token)
    end
end
