class User < ActiveRecord::Base
  has_one :klass

  before_create :create_remember_token

  validates :username, presence: true,
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

  ##从第1页开始
  #def User.find_by_page(page, size, conditions, select='*')
  #  if conditions.nil?
  #    count = User.count
  #    users = User.select(select).order(created_at: :desc).limit(size).offset((page-1)*size)
  #  else
  #    count = User.where(conditions).count
  #    users = User.select(select).where(conditions).order(created_at: :desc).limit(size).offset((page-1)*size)
  #  end
  #  page_total = (count.to_f/size.to_f).ceil
  #  return {page_total: page_total, total: count, users: users}
  #end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
