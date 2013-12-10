class Activity < ActiveRecord::Base
  belongs_to :klass
  has_many :pictures
end
