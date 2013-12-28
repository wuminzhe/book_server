# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'clean uploads'
`rm -rf #{Rails.root}/public/uploads`
`mkdir #{Rails.root}/public/uploads`

puts 'create seed records...'
user = User.create username: '张老师', password: '123456', password_confirmation: '123456'

klass = Klass.create name: '中二班', grade: 2, number: 2, user: user

activities = []
['五一劳动节', '六一儿童节', '我们的学校', '我的班级我的家', '我的第一次'].each do |title|
  activities << Activity.create(title: title, klass: klass)
end

def create_pictures_for_activity(activity, generate_next_year=false)
  pictures = []
  year = Time.now.strftime('%Y')
  previous_year = year.to_i - 1
  next_year = year.to_i + 1
  21.times do |i|
    pictures << Picture.create(klass: activity.klass, activity: activity, year: year)
  end
  pictures << Picture.create(klass: activity.klass, activity: activity, year: previous_year)
  if generate_next_year
    pictures << Picture.create(klass: activity.klass, activity: activity, year: next_year)
    pictures << Picture.create(klass: activity.klass, activity: activity, year: next_year)
  end
  return pictures
end
pictures = create_pictures_for_activity(activities[1])
pictures.concat(create_pictures_for_activity(Activity.first, true))

students = []
29.times do |i|
  name = "同学#{i+1}"
  students << Student.create(name: name, number: i+1, phone: 13851707080+i, klass_id: klass.id)
end

pictures.each_with_index do |picture, i|
  if i <= 15
    StudentPictureAssociation.create student: students[0], picture: picture
  else
    StudentPictureAssociation.create student: students[1], picture: picture
  end
end

template = Template.create(content: '')

PhotoBook.create(template: template, student: students[1], content: '')

Sticker.create src: '/images/stickers/jmf.jpg'
Sticker.create src: '/images/stickers/snb.jpg'
Sticker.create src: '/images/stickers/atm.jpg'

Frame.create id: 5, src: 'http://115.29.170.136:3000/images/masks/mask1.png'

Administrator.create( username: 'admin', password: '123456', password_confirmation: '123456')





