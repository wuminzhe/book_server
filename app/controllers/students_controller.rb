class StudentsController < ApplicationController
  before_action :set_main_menu_id

  def index
    klass = Klass.find(params[:klass_id])
    @students = klass.students
  end

  def activities
    @student = Student.find(params[:student_id])
  end

  def pictures
    @student = Student.find(params[:student_id])
    @activity = Activity.find(params[:activity_id])
    @pictures = @student.pictures_by_activity(@activity)
  end

  private

  def set_main_menu_id
    @main_menu_id = 'classify'
  end
end
