class Admin::AdministratorsController < Admin::BaseController
  def index
    @administrators = Administrator.all
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.create(administrator_params)
    if @administrator.save
      # Handle a successful save.
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  def update
    @administrator = Administrator.find(params[:id])
    if @administrator.update_attributes(administrator_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    admin = Administrator.find(params[:id])
    if admin.typo == 1 # 学校管理员
      admin.destroy
    elsif admin.typo == 0 # 管理员，必须剩一个，不能全删除
      if Administrator.where(typo: 0).count() > 1
        admin.destroy
      end
    end
    
    redirect_to action: :index
  end

  private

    def administrator_params
      params.require(:administrator).permit(:username, :password, :password_confirmation, :typo, :school_id)
    end
end
