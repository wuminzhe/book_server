class ActivityPictureAssociation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :picture
end
