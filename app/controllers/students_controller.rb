class StudentsController < ApplicationController
  def index
    klass = Klass.find(params[:klass_id])
    @students = klass.students
    render layout: false
  end

  def activities
    @student = Student.find(params[:student_id])
    #student.klass.activities
    render layout: false
  end

  def pictures
    @student = Student.find(params[:student_id])
    @activity = Activity.find(params[:activity_id])
    @pictures = []
    @student.pictures.each do |picture|
      if picture.activities.include? @activity
        @pictures << picture
      end
    end

  end
end
