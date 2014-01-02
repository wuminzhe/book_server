class Klass < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  # destroy这个班级，会级联删除这个班级下的活动，然后继续级联删除这个班级的照片
  has_many :activities, dependent: :destroy
  # destroy这个班级，会级联删除这个班级下的学生
  has_many :students, -> { order(number: :asc) }, dependent: :destroy
  has_many :pictures

  validates :name, :grade, :number, :user_id, presence: true
  validates :grade, inclusion: { in: [1, 2, 3] }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :number, uniqueness: { scope: :grade, message: "在这个年级中已经有%{value}班了" }

  after_create :add_default_activities

  scope 'name_like', ->(name) {
    where('name like ?', "%#{name}%")
  }

  def tmp_activity
    Activity.where(typo: 2).first
  end

  private

    def add_default_activities
      # 临时 和 家长 两个默认活动(包)
      Activity.create(title: '家长', klass_id: self.id, typo: 1)
      Activity.create(title: '临时', klass_id: self.id, typo: 2)
    end

end
