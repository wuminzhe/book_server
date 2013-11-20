class Student < ActiveRecord::Base
  belongs_to :klass
  has_many :student_picture_associations
  has_many :pictures, through: :student_picture_associations
end
