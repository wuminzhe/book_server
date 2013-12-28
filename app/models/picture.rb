require 'carrierwave/orm/activerecord'

class Picture < ActiveRecord::Base
  has_many :student_picture_associations
  has_many :students, through: :student_picture_associations
  belongs_to :klass
  belongs_to :activity

  mount_uploader :src, ImageUploader
end
