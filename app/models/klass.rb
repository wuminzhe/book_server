class Klass < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :students, -> { order(number: :asc) }, dependent: :delete_all
  has_many :pictures

  validates :name, :grade, :number, :user_id, presence: true
  validates :grade, inclusion: { in: [1, 2, 3] }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :number, uniqueness: { scope: :grade, message: "在这个年级中已经有%{value}班了" }


  scope 'name_like', ->(name) {
    where('name like ?', "%#{name}%")
  }

  # GRADE_LABELS = [['小', 1], ['中', 2], ['大', 3]]

  # def grade_label
  #   GRADE_LABELS.each do |label|
  #     if label[1] === grade
  #       return label[0]
  #     end
  #   end
  # end

end
