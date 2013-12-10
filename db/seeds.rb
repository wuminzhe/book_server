# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user = User.create username: '张老师', password: '123456', password_confirmation: '123456'


Klass.delete_all
klass = Klass.create name: '中二班', grade: 2, number: 2, user: user

Activity.delete_all
activities = []
['五一劳动节', '六一儿童节', '我们的学校', '我的班级我的家', '我的第一次'].each do |title|
  activities << Activity.create(title: title, klass: klass)
end

Picture.delete_all
pictures = []
21.times do |i|
  pictures << Picture.create(src: "http://115.29.170.136:3000/uploads/#{i}.jpg", klass: klass, activity: activities[1])
end

Student.delete_all
students = []
29.times do |i|
  name = "同学#{i+1}"
  students << Student.create(name: name, number: i+1, klass: klass, avatar: 'http://www.qqzi.net/uploads/allimg/1202/1500254D4-0.jpg')
end

StudentPictureAssociation.delete_all
21.times do |i|
  if i <= 9
    StudentPictureAssociation.create student: students[0], picture: pictures[i]
  else
    StudentPictureAssociation.create student: students[1], picture: pictures[i]
  end

end

Sticker.delete_all
Sticker.create src: 'http://115.29.170.136:3000/images/stickers/jmf.jpg'
Sticker.create src: 'http://115.29.170.136:3000/images/stickers/snb.jpg'
Sticker.create src: 'http://115.29.170.136:3000/images/stickers/atm.jpg'



