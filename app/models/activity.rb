class Activity < ActiveRecord::Base
  belongs_to :klass
  has_many :activity_picture_associations
  has_many :pictures, through: :activity_picture_associations
end
