class PhotoBook < ActiveRecord::Base
  belongs_to :student
  belongs_to :template
end
