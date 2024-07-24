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
  user.name = "carrot母さん"
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
  user.is_active = false
end

banana = User.find_or_create_by!(email: "banana@example.com") do |user|
  user.name = "banana太郎"
  user.password = "password"
  user.is_active = true
end

kiwi = User.find_or_create_by!(email: "kiwi@example.com") do |user|
  user.name = "kiwi父さん"
  user.password = "password"
  user.is_active = true
end

pumpkin = User.find_or_create_by!(email: "pumpkin@example.com") do |user|
  user.name = "pumpkinパパ"
  user.password = "password"
  user.is_active = true
end

radish = User.find_or_create_by!(email: "radish@example.com") do |user|
  user.name = "radish母さん"
  user.password = "password"
  user.is_active = true
end

peach = User.find_or_create_by!(email: "peach@example.com") do |user|
  user.name = "peach子"
  user.password = "password"
  user.is_active = false
end

melon = User.find_or_create_by!(email: "melon@example.com") do |user|
  user.name = "melonママ"
  user.password = "password"
  user.is_active = true
end

bean = User.find_or_create_by!(email: "bean@example.com") do |user|
  user.name = "bean太郎"
  user.password = "password"
  user.is_active = true
end

tomato = User.find_or_create_by!(email: "tomato@example.com") do |user|
  user.name = "toma父さん"
  user.password = "password"
  user.is_active = true
end

# Award
Award.find_or_create_by!(comment: "毎日準備！毎日完食！ありがとう") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a01.jpg"), filename:"sample-a01.jpg")
  award.user = carrot
end

Award.find_or_create_by!(comment: "真剣に卵の殻をむいてくれる息子。ちょっと卵が小さくなっても気にしない！むき終わりに達成感にあふれた顔を見せてくれました。") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a02.jpg"), filename:"sample-a02.jpg")
  award.user = carrot
end

# GrandPrize
GrandPrize.find_or_create_by!(name: "全力泣き") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g01.jpg"), filename:"sample-g01.jpg")
  grand_prize.introduction = "どんなことをしても、何を言っても泣き止んでくれない時は誰しも経験するのでは。。。ふいに、泣きが全力過ぎて、面白くなってくること、ありますよね？？"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
	grand_prize.keyword_2 = "お手上げ"
	grand_prize.keyword_3 = "あるある"
end

GrandPrize.find_or_create_by!(name: "お手伝い") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g02jpg"), filename:"sample-g02.jpg")
  grand_prize.introduction = "お手伝いしたい気持ちは無下にしたくないけど、家事は早く終わらせたいしキッチンは汚したくない、、、日々葛藤！"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
	grand_prize.keyword_2 = "ママの真似"
	grand_prize.keyword_3 = "お手伝い"
end

GrandPrize.find_or_create_by!(name: "予防接種") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g03jpg"), filename:"sample-g03.jpg")
  grand_prize.introduction = "こどものためとはわかっていても、針が刺さるのを見るのは辛い！こどもはもっと辛い？？注射はいつから平気になるのかな？"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
	grand_prize.keyword_2 = "注射"
	grand_prize.keyword_3 = "ばんそうこう"
end

GrandPrize.find_or_create_by!(name: "とにかく大好き！") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g04jpg"), filename:"sample-g04.jpg")
  grand_prize.introduction = "電車？〇ンパンマン？絵本？公園？パ〇パトロール？これさえあれば！な心の友達"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
end

GrandPrize.find_or_create_by!(name: "何度でも何度でも何度でも♪") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g05jpg"), filename:"sample-g05.jpg")
  grand_prize.introduction = "鳴りやまないアンコール！今日は何回かしら。今日はとことん付き合おう！"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
end

GrandPrize.find_or_create_by!(name: "おやさい・くだもの") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g06.jpg"), filename:"sample-g06.jpg")
  grand_prize.introduction = "野菜や果物を買うと、赤ちゃんや子供に持たせたくなるのはなんでだろう？？持つだけで、かわいい～"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 0
end

GrandPrize.find_or_create_by!(name: "お食い初め") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g11.jpg"), filename:"sample-g11.jpg")
  grand_prize.introduction = "100日分の成長への感謝、これからの成長、一生食べ物に困りませんように、の思いを込めて！"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 1
	grand_prize.keyword_2 = "お食い初め"
	grand_prize.keyword_3 = "100日"
end

# Applause
Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 2
end

# WaitingEvent
WaitingEvent.find_or_create_by!(user: carrot) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w01.jpg"), filename:"sample-w01.jpg")
  waiting_event.grand_prize_id = 3
  waiting_event.comment = "何とかご機嫌のうちに撮影できた！いっちょ前の袴姿にみんなでほっこり～"
end

# Event
Event.find_or_create_by!(user: onion) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e01.jpg"), filename:"sample-e01.jpg")
  event.grand_prize_id = 3
  event.comment = "ごひいきのお魚屋さん、いつもありがとう！"
end

# Praise
Praise.find_or_create_by!(user: potato) do |praise|
  praise.grand_prize_id = 3
  praise.comment = "立派な鯛！！ご準備素敵！お疲れ様です～"
end