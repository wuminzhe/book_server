class Admin::SchoolsController < Admin::BaseController
  def index
    @schools = School.includes(:klasses, :teachers, :administrators).order(status: :desc, created_at: :desc)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      # Handle a successful save.
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    school = School.find(params[:id])
    school.status = 0
    school.save
    redirect_to action: :index
  end

  private

    def school_params
      params.require(:school).permit(:name)
    end
end
