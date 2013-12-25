class Admin::BaseController < ApplicationController
  layout 'admin/application'
  skip_before_filter :verify_authenticity_token
  before_filter :signed_in_check

  include Admin::SessionsHelper


  private

    def signed_in_check
      unless signed_in?
        store_location
        flash[:warning] = '请登录'
        redirect_to admin_signin_url
      end
    end

end