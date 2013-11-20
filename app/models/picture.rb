class Picture < ActiveRecord::Base
  has_many :activity_picture_associations
  has_many :activities, :through => :activity_picture_associations
  has_many :student_picture_associations
  has_many :students, through: :student_picture_associations
end
