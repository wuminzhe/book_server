class UsersController < ApplicationController
  before_action :signed_in_user_check, only: [:show, :index]
  before_action :correct_user_check,   only: [:show]

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
  end

  private 

    # Before filters

    def signed_in_user_check
      unless signed_in?
        store_location
        flash[:warning] = "请登录"
        redirect_to signin_url
      end
    end

    def correct_user_check
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
