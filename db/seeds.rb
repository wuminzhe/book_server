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
puts 'create schools'
school0 = School.create name: '南京市百家湖幼儿园'
school1 = School.create name: '南京市鼓楼区育红幼儿园'

puts 'create teachers'
teacher0 = User.create username: '张老师', password: '123456', password_confirmation: '123456', school: school0
teacher1 = User.create username: '李老师', password: '123456', password_confirmation: '123456', school: school1

puts 'create klasses'
klass0 = Klass.create name: '中2班', grade: 2, number: 2, user: teacher0, school: school0
klass1 = Klass.create name: '小2班', grade: 1, number: 2, user: teacher1, school: school1

puts 'create activities'
activities = []
['五一劳动节', '六一儿童节', '我们的学校', '我的班级我的家', '我的第一次'].each do |title|
  activities << Activity.create(title: title, klass: klass0)
end

puts 'create pictures'
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

puts 'create students'
students = []
29.times do |i|
  name = "同学#{i+1}"
  students << Student.create(name: name, number: i+1, phone: 13851707080+i, klass_id: klass0.id)
end

pictures.each_with_index do |picture, i|
  if i <= 15
    StudentPictureAssociation.create student: students[0], picture: picture
  else
    StudentPictureAssociation.create student: students[1], picture: picture
  end
end

template = Template.create(content: '<?xml version="1.0" encoding="utf-8"?><project><property><pageWidth>595</pageWidth><pageHeight>737</pageHeight><imageWidth>1990</imageWidth><imageHeight>2464</imageHeight></property><page><backgroundImage>http://ameeting.com.cn:9999/assets/img/bg.png</backgroundImage><item><type>text</type><index>1</index><value><![CDATA[<HTML><BODY><P ALIGN="left"><FONT FACE="Courier New" SIZE="14" COLOR="#ff0000" LETTERSPACING="0" KERNING="1"><FONT COLOR="#000000"><B>这个学期我很努力的做一名好孩子</B></FONT></FONT></P></BODY></HTML>]]></value><x>74</x><y>195</y><width>458</width><height>110</height><rotation>0</rotation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>0</alpha><color>0</color></shadow><border><thickness>0</thickness><color>9778561</color></border><fill><color>0</color><alpha>0</alpha></fill></item><item><type>shape</type><url>null</url><model><x>47</x><y>427</y><width>247</width><height>219</height><rotation>0</rotation></model><index>2</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>331</x><y>435</y><width>199.03548387096777</width><height>184.18208955223884</height><rotation>0</rotation></model><index>3</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>291</x><y>71</y><width>259</width><height>182</height><rotation>0</rotation></model><index>4</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>5</shape><shapeImageUrl>http://115.29.170.136:3000/images/masks/mask1.png</shapeImageUrl><border><thickness>12</thickness><color>9778561</color></border><alpha>1</alpha></item></page><page><backgroundImage>http://ameeting.com.cn:9999/images/p25_bg.png</backgroundImage><item><type>text</type><index>1</index><value><![CDATA[<HTML><BODY><P ALIGN="left"><FONT FACE="Courier New" SIZE="14" COLOR="#ff0000" LETTERSPACING="0" KERNING="1"><FONT COLOR="#000000"><B>这个学期我很努力的做一名好孩子</B></FONT></FONT></P></BODY></HTML>]]></value><x>74</x><y>132</y><width>300</width><height>100</height><rotation>0</rotation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>0</alpha><color>0</color></shadow><border><thickness>0</thickness><color>9778561</color></border><fill><color>0</color><alpha>0</alpha></fill></item><item><type>text</type><index>2</index><value><![CDATA[<HTML><BODY><P ALIGN="left"><FONT FACE="Courier New" SIZE="14" COLOR="#ff0000" LETTERSPACING="0" KERNING="1"><FONT COLOR="#000000"><B>这个学期我很努力的做一名好孩子</B></FONT></FONT></P></BODY></HTML>]]></value><x>68</x><y>304</y><width>300</width><height>100</height><rotation>0</rotation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>0</alpha><color>0</color></shadow><border><thickness>0</thickness><color>9778561</color></border><fill><color>0</color><alpha>0</alpha></fill></item><item><type>shape</type><url>null</url><model><x>54</x><y>420</y><width>226</width><height>142</height><rotation>0</rotation></model><index>3</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>296</x><y>424</y><width>246</width><height>138</height><rotation>0</rotation></model><index>4</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>56</x><y>570</y><width>117</width><height>112</height><rotation>0</rotation></model><index>5</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>202</x><y>575</y><width>120</width><height>106</height><rotation>0</rotation></model><index>6</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item><item><type>shape</type><url>null</url><model><x>349</x><y>568</y><width>188</width><height>119</height><rotation>0</rotation></model><index>7</index><flip>false</flip><currentRotate>1</currentRotate><currentZoomVal>1</currentZoomVal><centerX>0.5</centerX><centerY>0.5</centerY><rotation>0</rotation><effect>0</effect><brightness>2</brightness><contrast>0</contrast><saturation>0</saturation><shadow><blur>4</blur><distance>4</distance><rotation>45</rotation><alpha>1</alpha><color>0</color></shadow><shape>0</shape><shapeImageUrl>null</shapeImageUrl><border><thickness>0</thickness><color>9778561</color></border><alpha>1</alpha></item></page></project>')

PhotoBook.create(template: template, student: students[1], content: template.content)

Sticker.create src: '/images/stickers/jmf.jpg'
Sticker.create src: '/images/stickers/snb.jpg'
Sticker.create src: '/images/stickers/atm.jpg'
Frame.create id: 5, src: '/images/masks/mask1.png'

# 后台管理用户
# 学校管理员
Administrator.create(username: 'admin0', password: '123456', password_confirmation: '123456', home: '/admin/klasses', typo: 1, school: school0)
# 主管理员
Administrator.create(username: 'admin1', password: '123456', password_confirmation: '123456', home: '/admin/schools', typo: 0)