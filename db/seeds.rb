# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者のログイン情報
admin = Admin.find_or_initialize_by(email: ENV['ADMIN_EMAIL'])
admin.password = ENV['ADMIN_PASSWORD']
admin.save!

# テストデータ
# User
carrot = User.find_or_create_by!(email: "carrot@example.com") do |user|
  user.name = "carrot太郎"
  user.password = "password"
  user.is_active = true
end

onion = User.find_or_create_by!(email: "onion@example.com") do |user|
  user.name = "onionママ"
  user.password = "password"
  user.is_active = true
end

potato = User.find_or_create_by!(email: "potato@example.com") do |user|
  user.name = "potato子"
  user.password = "password"
  user.is_active = true
end

# Award
Award.find_or_create_by!(comment: "祝・100日！") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-award1.jpg"), filename:"sample-award1.jpg")
  award.user = carrot
end

# GrandPrize
GrandPrize.find_or_create_by!(name: "お食い初め") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-gp1.jpg"), filename:"sample-gp1.jpg")
  grand_prize.introduction = "100日分の成長への感謝、これからの成長、一生食べ物に困りませんように、の思いを込めて！"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 1
	grand_prize.keyword_2 = "お食い初め"
	grand_prize.keyword_3 = "100日"
end

# Applause
Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 26
end

# WaitingEvent
WaitingEvent.find_or_create_by!(user: carrot) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-we1.jpg"), filename:"sample-we1.jpg")
  waiting_event.grand_prize_id = 14
  waiting_event.comment = "何とかご機嫌のうちに撮影できた！いっちょ前の袴姿にみんなでほっこり～"
end

# Event
Event.find_or_create_by!(user: onion) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e1.jpg"), filename:"sample-e1.jpg")
  event.grand_prize_id = 14
  event.comment = "ごひいきのお魚屋さん、いつもありがとう！"
end

# Praise
Praise.find_or_create_by!(user: potato) do |praise|
  praise.grand_prize_id = 14
  praise.comment = "立派な鯛！！ご準備素敵！お疲れ様です～"
end