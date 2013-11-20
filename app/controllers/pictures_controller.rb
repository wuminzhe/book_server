class PicturesController < ApplicationController
  def index
    @activity = Activity.find(params[:activity_id])
    @pictures = @activity.pictures
    render layout: false
  end

  def index_by_student
    @activity = Activity.find(params[:activity_id])
  end


end
