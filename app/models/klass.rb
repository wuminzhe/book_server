class Klass < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :students
end
