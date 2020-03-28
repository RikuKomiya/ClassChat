# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# i = 1
# 3.times do 
#   Lecture.create(name: "lecture#{i}", professor_name: "教授{¥#{i}", period: "1")
#   i += 1
# end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
["コミュニティ福祉学部", "観光学部", "経営学部", "経済学部", "現代心理学部", "社会学部", "文学部", "法学部", "理学部", "異文化コミュニケーション学部", "Ｇｌｏｂａｌ　Ｌｉｂｅｒａｌ　Ａｒｔｓ　Ｐｒｏｇｒａｍ（ＧＬＡＰ）"].each do |f|
  Facluty.create(name: f,university_id: 1)
end