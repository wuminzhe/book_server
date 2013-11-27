require 'digest/sha1'
require 'json'

class PicturesController < ApplicationController

  def index
    @activity = Activity.find(params[:activity_id])
    @pictures = @activity.pictures
    @activities = current_user.klass.activities #用于转移等下拉列表
    render layout: false
  end

  def index_by_student
    @activity = Activity.find(params[:activity_id])
  end

  def move_to_activity
    picture_ids = params[:picture_ids]
    src_activity = Activity.find params[:src_activity_id]
    dest_activity = Activity.find params[:dest_activity_id]
    picture_ids.each do |picture_id|
      picture = Picture.find(picture_id)
      picture.activities.delete(src_activity)
      picture.activities << dest_activity
      picture.save
    end

    render json: { result: 1 }
  end

  def create
    urls = params[:urls]
    activity = Activity.find params[:activity_id]
    urls.each do |url|
      Picture.create(src: url, klass: current_user.klass, used: 0, activities: [activity])
    end

    render json: { result: 1 }
  end

  def upload
    tmp_file = params[:file]
    File.open(Rails.root.join('public', 'uploads', tmp_file.original_filename), 'wb') do |file|
      file.write(tmp_file.tempfile.read)
    end
    render json: { url: "http://#{request.host_with_port}/uploads/#{tmp_file.original_filename}" }
  end


  def test
    @part = 'baby'
    respond_to do |format|
      format.js
    end
  end

end
