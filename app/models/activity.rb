class Activity < ActiveRecord::Base
  belongs_to :klass
  has_many :pictures

  def pictures_of_year(year)
    Picture.where(year: year, activity_id: self.id)
  end

  def years
    result = []
    pictures = Picture.where(activity_id: self.id).select(:year).order(:year).distinct
    pictures.each do |picture|
      result << picture.year
    end
    return result
  end

  def reserved?
    self.typo != 0
  end
end
