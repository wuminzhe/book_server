class ActivitiesController < ApplicationController
  before_action :set_main_menu_id

  def index
    klass = Klass.find(params[:klass_id])
    @activities = klass.activities
  end

  private

  def set_main_menu_id
    @main_menu_id = 'update_images'
  end
end
