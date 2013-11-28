class ActivitiesController < ApplicationController
  def index
    klass = Klass.find(params[:klass_id])
    @activities = klass.activities
  end
end
