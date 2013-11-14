class SessionsController < ApplicationController


  def new
    if signed_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user, params[:session][:remember_password]
      redirect_back_or user
    else
      flash.now[:danger] = '用户名密码不正确！'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
