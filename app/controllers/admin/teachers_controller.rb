class Admin::TeachersController < Admin::BaseController

  def index
    @page = params[:page].present? ? params[:page] : 1 #第几页
    @teacher_name = params[:teacher_name] #查询参数，老师的名字
    @klass_name = params[:klass_name] #查询参数，班级的名称

    @teachers = User.includes(:klass).where(school: current_administrator.school)

    if @teacher_name.present?
      @teachers = @teachers.username_like(@teacher_name)
    end

    if @klass_name.present?
      @teachers = @teachers.klass_name_like(@klass_name)
    end

    @teachers = @teachers.paginate(page: @page, per_page: 10)
  end

  def new
    @teacher = User.new
  end

  def create
    @teacher = User.new(teacher_params)
    if @teacher.save
      # Handle a successful save.
      redirect_to action: :index, teacher_name: @teacher.username
    else
      render 'new'
    end
  end

  def destroy
    teacher_id = params[:id]
    #查询条件，用于返回列表页面时用的
    page = params[:page]
    teacher_name = params[:teacher_name]

    User.delete(teacher_id)

    redirect_to action: :index, page: page, teacher_name: teacher_name
  end

  def edit
    teacher_id = params[:id]

    @teacher = User.find(teacher_id)
  end

  def update
    teacher_id = params[:id]

    @teacher = User.find(teacher_id)
    if @teacher.update_attributes(teacher_params)
      redirect_to action: :index, teacher_name: @teacher.username
    else
      render 'edit'
    end

  end

  private

    def teacher_params
      result = params.require(:teacher).permit(:username, :password, :password_confirmation)
      result["school_id"] = current_administrator.school.id
      return result
    end



end