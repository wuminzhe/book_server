class Student < ActiveRecord::Base
  belongs_to :klass
  has_many :student_picture_associations
  has_many :pictures, through: :student_picture_associations
  has_many :photo_books

  # 根据活动获取这个学生的照片
  def pictures_by_activity(activity)
    pics = []
    pictures.each do |picture|
      if picture.activity == activity
        pics << picture
      end
    end
    return pics
  end

  # 获取某年的照片书，如果没有年份参数，那么就是返回今年的
  def photo_book(year=Time.now.year)
    photo_books.each do |pb|
      if pb.created_at.year == year.to_i
        return pb
      end
    end
  end

  def add_pictures(picture_ids)
    picture_ids.each do |picture_id|
      if not contains?(picture_id.to_i)
        StudentPictureAssociation.create(picture_id: picture_id, student_id: id)
      end
    end
  end

  def contains?(picture_id)
    pictures.each do |picture|
      if picture.id === picture_id
        return true
      end
    end
    false
  end
end
