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

Award.find_or_create_by!(comment: "眠いのになかなか眠れずぐずり倒したその後、、、") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a02.jpg"), filename:"sample-a02.jpg")
  award.user = carrot
end

Award.find_or_create_by!(comment: "子供のリクエストにお応えして、大好きな絵本からおにぎりのあの子を作りました！わかるかな？") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a03.jpg"), filename:"sample-a03.jpg")
  award.user = carrot
end

Award.find_or_create_by!(comment: "自分と弟のオムツを運んでくれた！お兄ちゃん感！感動です。") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a04.jpg"), filename:"sample-a04.jpg")
  award.user = carrot
end

Award.find_or_create_by!(comment: "ちょっと寒い中、まちのゴミ拾いイベントへ！トングはほぼ手だったけど、頑張りました！") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a05.jpg"), filename:"sample-a05.jpg")
  award.user = onion
end

Award.find_or_create_by!(comment: "何をやっても泣き止まず、、、これが噂の黄昏泣き。") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a06.jpg"), filename:"sample-a06.jpg")
  award.user = onion
end

Award.find_or_create_by!(comment: "にんじん大好き！この食べ方が一番好き、助かる！") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a07.jpg"), filename:"sample-a07.jpg")
  award.user = banana
end

Award.find_or_create_by!(comment: "おトイレ頑張ったシールと満点笑顔！") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a08.jpg"), filename:"sample-a08.jpg")
  award.user = banana
end

Award.find_or_create_by!(comment: "なめられ、もとい、噛まれ太郎。兄弟分、お疲れさまでした！") do |award|
  award.award_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-a09.jpg"), filename:"sample-a09.jpg")
  award.user = kiwi
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

GrandPrize.find_or_create_by!(name: "兄弟姉妹のご対面！") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g12.jpg"), filename:"sample-g12.jpg")
  grand_prize.introduction = "赤ちゃんとの初対面！どうか仲良しになれますように。。。"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 1
	grand_prize.keyword_2 = "退院"
	grand_prize.keyword_3 = "赤ちゃん返り"
end

GrandPrize.find_or_create_by!(name: "こんにち歯") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g13.jpg"), filename:"sample-g13.jpg")
  grand_prize.introduction = "最初の歯が、こんにち歯！ちいさい歯がかわいい！一方で、これからの授乳がちょっと怖い～"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 1
	grand_prize.keyword_2 = "歯"
end

GrandPrize.find_or_create_by!(name: "つかまり立ち") do |grand_prize|
  grand_prize.grand_prize_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-g14.jpg"), filename:"sample-g14.jpg")
  grand_prize.introduction = "とうとう立った！転ぶのが怖くて、ますます目が離せない～"
  grand_prize.owner_id = admin.id
	grand_prize.keyword_1 = 1
	grand_prize.keyword_2 = "たっち"
	grand_prize.keyword_3 = "頭クッション"
end

# Applause
Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 5
end

Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 6
end

Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 7
end

Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 8
end

Applause.find_or_create_by!(user: carrot) do |applause|
  applause.award_id = 9
end

Applause.find_or_create_by!(user: onion) do |applause|
  applause.award_id = 4
end

Applause.find_or_create_by!(user: onion) do |applause|
  applause.award_id = 7
end

Applause.find_or_create_by!(user: pumpkin) do |applause|
  applause.award_id = 4
end

Applause.find_or_create_by!(user: pumpkin) do |applause|
  applause.award_id = 7
end

Applause.find_or_create_by!(user: radish) do |applause|
  applause.award_id =4
end

Applause.find_or_create_by!(user: melon) do |applause|
  applause.award_id = 4
end

Applause.find_or_create_by!(user: bean) do |applause|
  applause.award_id = 4
end

Applause.find_or_create_by!(user: tomato) do |applause|
  applause.award_id = 4
end

# WaitingEvent
WaitingEvent.find_or_create_by!(user: banana) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w011.jpg"), filename:"sample-w011.jpg")
  waiting_event.grand_prize_id = 1
  waiting_event.comment = "こらえる泣き方。うつ伏せ練習、これにて終了！"
end

WaitingEvent.find_or_create_by!(user: kiwi) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w031.jpg"), filename:"sample-w031.jpg")
  waiting_event.grand_prize_id = 2
  waiting_event.comment = "はんこ注射は時間がたってからポチポチが出てくるんだそうな！"
end

WaitingEvent.find_or_create_by!(user: pumpkin) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w032.jpg"), filename:"sample-w032.jpg")
  waiting_event.grand_prize_id = 3
  waiting_event.comment = "注射は親・子、共に大変だったけど、かわいいばんそうこうにほっこり。"
end

WaitingEvent.find_or_create_by!(user: carrot) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w041.jpg"), filename:"sample-w041.jpg")
  waiting_event.grand_prize_id = 4
  waiting_event.comment = "電車と同じ目線で遊ぶのがお気に入りのスタイル。"
end

WaitingEvent.find_or_create_by!(user: tomato) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w042.jpg"), filename:"sample-w042.jpg")
  waiting_event.grand_prize_id = 4
  waiting_event.comment = "スプーン大好き！ご飯が楽しみだね！"
end

WaitingEvent.find_or_create_by!(user: radish) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w051.jpg"), filename:"sample-w051.jpg")
  waiting_event.grand_prize_id = 5
  waiting_event.comment = "「もう一回！」と言う。ならせめて、乗ってるときは楽しそうな顔をしてよう～"
end

WaitingEvent.find_or_create_by!(user: onion) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w061.jpg"), filename:"sample-w061.jpg")
  waiting_event.grand_prize_id = 6
  waiting_event.comment = "いただきもののトマト。子供の顔くらいある！"
end

WaitingEvent.find_or_create_by!(user: banana) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w062.jpg"), filename:"sample-w062.jpg")
  waiting_event.grand_prize_id = 6
  waiting_event.comment = "赤ちゃんなら傘にできそうなくらいのシイタケ"
end

WaitingEvent.find_or_create_by!(user: kiwi) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w063.jpg"), filename:"sample-w063.jpg")
  waiting_event.grand_prize_id = 6
  waiting_event.comment = "冬は毎朝晩みかん！いとしの、みかん！"
end

WaitingEvent.find_or_create_by!(user: melon) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w064.jpg"), filename:"sample-w064.jpg")
  waiting_event.grand_prize_id = 6
  waiting_event.comment = "ばーばにもらった大きなピーマンで「もしもーし？」ものボケ、100点！"
end

WaitingEvent.find_or_create_by!(user: onion) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w111.jpg"), filename:"sample-w111.jpg")
  waiting_event.grand_prize_id = 7
  waiting_event.comment = "何とかご機嫌のうちに撮影できた！いっちょ前の袴姿にみんなでほっこり～"
end

WaitingEvent.find_or_create_by!(user: carrot) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w121.jpg"), filename:"sample-w121.jpg")
  waiting_event.grand_prize_id = 8
  waiting_event.comment = "病院にて弟に初対面！恐る恐る、なでなで。の、手はなぜか逆手！"
end

WaitingEvent.find_or_create_by!(user: carrot) do |waiting_event|
  waiting_event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-w141.jpg"), filename:"sample-w141.jpg")
  waiting_event.grand_prize_id = 10
  waiting_event.comment = "まだ不安定でお尻ぷりぷり。見守る兄。"
end

# Event
Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e011.jpg"), filename:"sample-e011.jpg")
  event.grand_prize_id = 1
  event.comment = "昼寝開けはご機嫌斜め。四角いお顔！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e021.jpg"), filename:"sample-e021.jpg")
  event.grand_prize_id = 2
  event.comment = "真剣な顔でキノコと向き合う、、、全部割いてくれてありがとう！"
end

Event.find_or_create_by!(user: onion) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e022.jpg"), filename:"sample-e022.jpg")
  event.grand_prize_id = 2
  event.comment = "プリンづくりは卵を割るところからお手伝い。冷めるのが待ちきれない！！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e031.jpg"), filename:"sample-e031.jpg")
  event.grand_prize_id = 3
  event.comment = "小さな腕に3回も注射！並ぶアンパンマンたち。"
end

Event.find_or_create_by!(user: bean) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e032.jpg"), filename:"sample-e032.jpg")
  event.grand_prize_id = 3
  event.comment = "注射の日はよく寝てくれる。。。小さな体でお疲れ様！"
end

Event.find_or_create_by!(user: bean) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e041.jpg"), filename:"sample-e041.jpg")
  event.grand_prize_id = 4
  event.comment = "こんなにながーーーーーーーくできました！"
end

Event.find_or_create_by!(user: tomato) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e041.jpg"), filename:"sample-e041.jpg")
  event.grand_prize_id = 4
  event.comment = "めんめん大好き！！"
end

Event.find_or_create_by!(user: kiwi) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e043.jpg"), filename:"sample-e043.jpg")
  event.grand_prize_id = 4
  event.comment = "図書館帰り。エンドレス絵本"
end

Event.find_or_create_by!(user: radish) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e044.jpg"), filename:"sample-e044.jpg")
  event.grand_prize_id = 4
  event.comment = "生まれたときからの相棒おくるみ。3年目！いつでも一緒～"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e051.jpg"), filename:"sample-e051.jpg")
  event.grand_prize_id = 5
  event.comment = "ラップの望遠鏡で電車を探す。もう一回見たいと言われたけど、、、次の電車は一時間後！！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e052.jpg"), filename:"sample-e052.jpg")
  event.grand_prize_id = 5
  event.comment = "いろんな滑り方をご披露。ありがとう！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e061.jpg"), filename:"sample-e061.jpg")
  event.grand_prize_id = 6
  event.comment = "顔と同じ大きさのトマト！"
end

Event.find_or_create_by!(user: onion) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e062.jpg"), filename:"sample-e062.jpg")
  event.grand_prize_id = 6
  event.comment = "大きなスイカとばーばお手製スイカロンパース！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e063.jpg"), filename:"sample-e063.jpg")
  event.grand_prize_id = 6
  event.comment = "知ってか知らずか、ガブリ！小さな歯型が付きました。"
end

Event.find_or_create_by!(user: tomato) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e064.jpg"), filename:"sample-e064.jpg")
  event.grand_prize_id = 6
  event.comment = "大きなシイタケに興味津々"
end

Event.find_or_create_by!(user: banana) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e065.jpg"), filename:"sample-e065.jpg")
  event.grand_prize_id = 6
  event.comment = "口いっぱいのイチゴ！エプロン大感謝！"
end

Event.find_or_create_by!(user: bean) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e065.jpg"), filename:"sample-e065.jpg")
  event.grand_prize_id = 6
  event.comment = "電話かな？電話じゃないよ、おナスだよ！"
end

Event.find_or_create_by!(user: carrot) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e111.jpg"), filename:"sample-e111.jpg")
  event.grand_prize_id = 7
  event.comment = "100日の「0」で遊ばれる、明日100日を迎える坊や。"
end

Event.find_or_create_by!(user: radish) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e112.jpg"), filename:"sample-e112.jpg")
  event.grand_prize_id = 7
  event.comment = "めでたい！"
end

Event.find_or_create_by!(user: pumpkin) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e121.jpg"), filename:"sample-e121.jpg")
  event.grand_prize_id = 8
  event.comment = "こんなに小さかったのか、とこんなに大きくなったのか！を実感。"
end

Event.find_or_create_by!(user: banana) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e131.jpg"), filename:"sample-e131.jpg")
  event.grand_prize_id = 9
  event.comment = "みーつけた！"
end

Event.find_or_create_by!(user: onion) do |event|
  event.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-e141.jpg"), filename:"sample-e141.jpg")
  event.grand_prize_id = 10
  event.comment = "ひっそりと自主練に励む"
end

# Praise
Praise.find_or_create_by!(user: carrot) do |praise|
  praise.grand_prize_id = 4
  praise.comment = "いろんな「好き」がありますね！"
end

Praise.find_or_create_by!(user: carrot) do |praise|
  praise.grand_prize_id = 7
  praise.comment = "立派なご飯はおっぱいになって赤ちゃんに届けます！"
end

Praise.find_or_create_by!(user: kiwi) do |praise|
  praise.grand_prize_id = 6
  praise.comment = "ついつい渡しちゃうのわかります"
end

Praise.find_or_create_by!(user: radish) do |praise|
  praise.grand_prize_id = 6
  praise.comment = "我が家も果物大好きで、果物破産しそうです！"
end

Praise.find_or_create_by!(user: kiwi) do |praise|
  praise.grand_prize_id = 8
  praise.comment = "泣ける～"
end
