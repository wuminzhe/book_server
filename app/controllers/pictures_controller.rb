require 'digest/sha1'
require 'json'

class PicturesController < ApplicationController
  before_action :set_main_menu_id

  def index
    @activity = Activity.find(params[:activity_id])
    @pictures = @activity.pictures
  end

  def index_by_student
    @activity = Activity.find(params[:activity_id])
  end

  def move_to_activity
    picture_ids = params[:picture_ids]
    src_activity_id = params[:src_activity_id]
    dest_activity_id = params[:dest_activity_id]

    #
    pictures = Picture.find(picture_ids.split(','))
    current_activity = Activity.find(src_activity_id)
    dest_activity = Activity.find(dest_activity_id)

    #
    current_activity.pictures.delete(pictures)
    pictures.each do |picture|
      dest_activity.pictures << picture
    end

    flash[:success] = '移动图片成功！'
    redirect_to activity_pictures_path(current_activity)
  end

  def copy_to_activity
    picture_ids = params[:picture_ids]
    src_activity_id = params[:src_activity_id]
    dest_activity_ids = params[:dest_activity_ids]

    #
    pictures = Picture.find(picture_ids.split(','))
    current_activity = Activity.find(src_activity_id)
    dest_activities = Activity.find(dest_activity_ids.split(','))

    # 先克隆出新的图片，然后将新图片绑到目标活动上
    dest_activities.each do |dest_activity|
      pictures.each do |picture|
        clone = picture.dup
        clone.save
        dest_activity.pictures << clone
      end
    end

    flash[:success] = '复制图片成功！'
    redirect_to activity_pictures_path(current_activity)
  end


  def remove_from_current_activity
    picture_ids = params[:picture_ids]
    src_activity_id = params[:src_activity_id]

    #
    pictures = Picture.find(picture_ids.split(','))
    current_activity = Activity.find(src_activity_id)

    #
    current_activity.pictures.delete(pictures)

    flash[:success] = '删除图片成功！'
    redirect_to activity_pictures_path(current_activity)
  end

  def assign_to_students
    picture_ids = params[:picture_ids]
    current_activity_id = params[:current_activity_id]
    student_ids = params[:student_ids]

    #
    pictures = Picture.find(picture_ids.split(','))
    current_activity = Activity.find(current_activity_id)
    students = Student.find(student_ids.split(','))

    #
    students.each do |student|
      pictures.each do |picture|
        student.pictures << picture
      end
      #student.add_pictures(picture_ids)
    end

    flash[:success] = '分配图片成功！'
    redirect_to activity_pictures_path(current_activity)
  end

  def create
    urls = params[:urls]
    activity = Activity.find params[:activity_id]
    urls.each do |url|
      Picture.create(src: url, klass: current_user.klass, used: 0, activity: activity)
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

  private

  def set_main_menu_id
    @main_menu_id = 'update_images'
  end

end
