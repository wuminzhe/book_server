class User < ActiveRecord::Base
  has_one :klass, dependent: :restrict_with_exception
  belongs_to :school

  before_create :create_remember_token

  validates :username, presence: true,
           length: { maximum: 50 },
           uniqueness: { case_sensitive: false } #大小写的用户名是同一个用户名

  validates :name, presence: true

  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  scope 'klass_name_like', ->(klass_name) {
    #joins(:klass).where('klasses.name like ?', "%#{klass_name}%")
    where('klasses.name like ?', "%#{klass_name}%").references(:klass)
  }

  scope 'username_like', ->(username) {
    where('username like ?', "%#{username}%")
  }

  scope 'no_klass_assigned', -> {
    where('id not in (select distinct(user_id) from klasses)')

  }

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
