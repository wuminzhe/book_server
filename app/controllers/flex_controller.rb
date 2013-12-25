class FlexController < ApplicationController
  skip_before_filter :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  #############################
  # front
  #############################

  def front_pictures
    student = Student.find(params[:student_id])
    result = {
        status: 1,
        data: {
            stickers: [
            ],
            pictures: [
            ]
        }
    }
    stickers = Sticker.all
    stickers.each do |sticker|
      result[:data][:stickers] << { id: sticker.id, src: sticker.src }
    end

    student.klass.activities.each do |activity|
      pictures = student.pictures_by_activity(activity)
      activity_pictures = {
          title: activity.title,
          items: []
      }
      pictures.each do |picture|
        activity_pictures[:items] << { id: picture.id, src: picture.src }
      end
      result[:data][:pictures] << activity_pictures

    end
    render json: result
  end

  def front_template
    student = Student.find(params[:student_id]) #student_id
    logger.debug student.photo_book
    render json: {
        status: 1,
        data: {
            content: student.photo_book.content
        }
    }
  end

  def save_front_template
    student = Student.find(params[:student_id]) #student_id
    template_content = params[:content]

    student.photo_book.content = template_content
    student.photo_book.save
    render json: { status: 1 }
  end

  #############################
  # back
  #############################

  def back_template
    params[:admin_id] # not use now
    template = Template.find(params[:template_id])
    render json: {
        status: 1,
        data: {
            content: template.content
        }
    }
  end

  def save_back_template
    params[:admin_id] # not use now
    content = params[:content]
    if params[:template_id].blank? # 没有模板id，新建
      template = Template.create content: content
    else
      template = Template.find(params[:template_id])
      template.content = content
      template.save
    end


    render json: { status: 1, data: { template_id: template.id } }
  end

  def back_frames
    frames = Frame.select('id, src')
    render json: { status: 1, data: frames }
  end

  private

  def record_not_found
    render json: { status: 0, error: 404 }
  end
end