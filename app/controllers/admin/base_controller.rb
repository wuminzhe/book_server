class Admin::BaseController < ApplicationController
  layout 'admin/application'

  include Admin::SessionsHelper
end