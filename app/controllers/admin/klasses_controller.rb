class Admin::KlassesController < Admin::BaseController
  def index
    @search = params[:search] #查询参数

    @klasses = Klass.includes(:user, :students).where(school: current_administrator.school).order(grade: :asc, number: :asc)

    if @search.present?
      @klasses = @klasses.where('klasses.name like ? or users.username like ? or students.name like ?', "%#{@search}%", "%#{@search}%", "%#{@search}%")
    end
    
  end

  def new
    @klass = Klass.new
    @klass.number = 1
  end

  def create
    @klass = Klass.new(klass_params)
    if @klass.save
      redirect_to admin_klasses_path
    else
      render 'new'
    end
  end

  def destroy
    klass_id = params[:id]
    #查询条件，用于返回列表页面时用的
    page = params[:page]
    search_klass_name = params[:search_klass_name]

    # 删除这个班级，这个操作会同时删除这个班级的学生和活动
    Klass.destroy(klass_id) 

    redirect_to action: :index, page: page, search_klass_name: search_klass_name
  end

  def edit
    klass_id = params[:id]

    @klass = Klass.find(klass_id)
  end

  def update
    klass_id = params[:id]

    @klass = Klass.find(klass_id)
    if @klass.update_attributes(klass_params)
      redirect_to action: :index, search_klass_name: @klass.name
    else
      render 'edit'
    end

  end

  private

    def klass_params
      result = params.require(:klass).permit(:name, :grade, :number, :user_id)
      result['school_id'] = current_administrator.school.id
      return result
    end

end
