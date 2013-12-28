class Admin::ActivitiesController < Admin::BaseController
  def index
    @klasses = Klass.all
    unless params[:klass_id].present?
      @klass = Klass.first
    else
      @klass = Klass.find(params[:klass_id])
    end
  end

  def new
    @activity = Activity.new(klass_id: params[:klass_id], show: 1)
    p @activity
    @klasses = Klass.all
  end

  def create
    @activity = Activity.create(activity_params)
    if @activity.save
      redirect_to action: 'index', klass_id: @activity.klass_id
    else
      render 'new'
    end
  end

  def edit
    activity_id = params[:id]
    @klasses = Klass.all
    @activity = Activity.find(activity_id)
  end

  def update
    activity_id = params[:id]

    @activity = Activity.find(activity_id)
    if @activity.update_attributes(activity_params)
      redirect_to action: :index, klass_id: @activity.klass_id
    else
      render 'edit'
    end

  end

  def destroy
    activity_id = params[:id]
    #查询条件，用于返回列表页面时用的
    klass_id = params[:klass_id]

    # 删除这个活动之前，这个活动下的所有照片都归到临时活动
    activity = Activity.find(activity_id)
    tmp_activity = Klass.find(klass_id).tmp_activity
    activity.pictures.each do |picture|
      picture.update_attributes(activity_id: tmp_activity.id)
    end

    # 删除活动
    Activity.delete(activity_id)


    redirect_to action: :index, klass_id: klass_id
  end

  private

    def activity_params
      params.require(:activity).permit(:title, :klass_id, :show)
    end
end