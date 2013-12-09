class Activity < ActiveRecord::Base
  belongs_to :klass
  has_many :activity_picture_associations
  has_many :pictures, through: :activity_picture_associations

  def add_pictures(picture_ids)
    picture_ids.each do |picture_id|
      if not contains?(picture_id.to_i)
        ActivityPictureAssociation.create(picture_id: picture_id, activity_id: id)
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
