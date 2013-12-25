module Admin::KlassesHelper
  def teachers_for_select(teacher_to_include=nil)
    result = []
    teachers = User.no_klass_assigned
    teachers.each do |teacher|
      result << [teacher.username, teacher.id]
    end
    unless teacher_to_include.nil?
      result << [teacher_to_include.username, teacher_to_include.id]
    end
    result
  end

  def grades_for_select
    [['小', 1], ['中', 2], ['大', 3]]
  end

  def grade(grade_id)
    grades_for_select.each do |grade|
      if grade[1] === grade_id
        return grade[0]
      end
    end
  end
end
