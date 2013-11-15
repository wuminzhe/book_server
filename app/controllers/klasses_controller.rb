class KlassesController < ApplicationController
  def show
    teacher = User.find(params[:user_id])
    render json: teacher.klass, only: [:id, :name]
  end
end
