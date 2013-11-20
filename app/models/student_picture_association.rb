class StudentPictureAssociation < ActiveRecord::Base
  belongs_to :student
  belongs_to :picture
end
