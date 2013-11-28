class StudentsController < ApplicationController
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
end
