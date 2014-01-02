require 'mime/types'

class Admin::StudentsController < Admin::BaseController
  
  def new
    @student = Student.new

    if params[:klass_id].present?
      @student.klass_id = params[:klass_id].to_i
      @student.number = get_next_number(params[:klass_id])
    end
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      redirect_to admin_klasses_path
    else
      render 'new'
    end
  end

  def edit
    student_id = params[:id]

    @student = Student.find(student_id)
  end

  def update
    student_id = params[:id]

    @student = Student.find(student_id)
    if @student.update_attributes(student_params)
      redirect_to admin_klasses_path
    else
      render 'edit'
    end
  end

  def destroy
    student_id = params[:id]
    Student.destroy(student_id)

    redirect_to admin_klasses_path
  end

  def move
    student_id = params[:student_id]
    klass_id = params[:klass_id]

    # 先将和这个学生绑定的图片解绑
    StudentPictureAssociation.delete_all(student_id: student_id)

    # 将student 移动到 klass
    Student.where(id: student_id).update_all(klass_id: klass_id, number: get_next_number(klass_id))

    redirect_to admin_klasses_path
  end

  private

    def student_params
      params.require(:student).permit(:name, :number, :phone, :avatar, :klass_id)
    end

    def get_next_number(klass_id)
      max_number_of_this_klass = Student.where(klass_id: klass_id).maximum('number')
      if not max_number_of_this_klass.nil?
        return max_number_of_this_klass + 1
      else
        return 1
      end
    end

end