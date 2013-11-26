class Student < ActiveRecord::Base
  belongs_to :klass
  has_many :student_picture_associations
  has_many :pictures, through: :student_picture_associations

  def pictures_by_activity(activity)
    pics = []
    pictures.each do |picture|
      if picture.activities.include? activity
        pics << picture
      end
    end
    return pics
  end
end
