class School < ActiveRecord::Base
  has_many :teachers, class_name: 'User'
  has_many :klasses
  has_many :administrators

  validates :name, presence: true
end
