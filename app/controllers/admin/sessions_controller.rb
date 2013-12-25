class Admin::SessionsController < Admin::BaseController
  skip_before_filter :signed_in_check

  def new
    if signed_in?
      redirect_to current_administrator
    else
      render layout: false
    end
  end

  def create
    administrator = Administrator.find_by(username: params[:session][:username])
    if administrator && administrator.authenticate(params[:session][:password])
      sign_in administrator, params[:session][:remember_password]
      redirect_back_or admin_klasses_path
    else
      flash[:error] = '用户名密码不正确！'
      redirect_to admin_url
    end
  end

  def destroy
    sign_out
    redirect_to admin_url
  end
end
