# User
user_names = %w[ちっぞう やまちゃん とみー たけるネス カイ ケンタ]
password = "password"

user_names.zip(1..(user_names.length)) do |name, n|
  user = User.create(name: name, email: "test#{n}@example.com",
                     password: password,
                     password_confirmation: password)
end


# Drink
user = User.find_by(name: "ちっぞう")
user.drinks.create(title: "TECATE", content: "メキシコのピルスナービール、あまり店頭では見かけないのでアマゾンなどでの購入をお勧めします", comment: "個人的にメキシコで飲んだ思い出もあり、めちゃくちゃ大好きなものです")
user.drinks.create(title: "モスコミュール", content: "ウォッカをジンジャーエールとライムで割ります。", comment: "甘くなくて飲みやすくて好きですが、合わせ方が分からないので、どなたか宜しくお願いいたします。")
user.drinks.create(title: "ゼロキロコークハイ", content: "通常のコークハイとは違い、ゼロキロカロリーのコーラを使って作ります", comment: "糖質オフにできることがうれしいのはもちろん、甘すぎなくてシンプルにおいしいです！")
user.drinks.create(title: "カルピスワイン", content: "ワインをカルピスを一対一の割合で割ります。", comment: "濁った色にはなりますが、味はおいしいのでぜひお試しあれ")
user.drinks.create(title: "カルピスワインソーダ", content: "カルピスワインのソーダバージョンで、ワインをカルピスソーダで割ります。カルピスは原液を使えば炭酸の強さも好みにできるのでおすすめ", comment: "かなり飲みやすいので、このソーダバージョンもお勧めです")

user = User.find_by(name: "とみー")
user.drinks.create(title: "サングリアのノンアルバージョン", content: "通常のサングリアをワインの変わりにぶどうジュースで作ることで子供でもおいしく飲むことができます", comment: "アルコールに弱いので作ってみました。ぜひ、合わせるおつまみを考えていただけるとうれしいです")
user.drinks.create(title: "シンデレラ(ノンアル)", content: "オレンジ、レモン、パイナップルのジュースを同じ比率で混ぜ合わせる", comment: "簡単にできるのでお勧めです^-^")

user = User.find_by(name: "たけるネス")
user.drinks.create(title: "黒糖焼酎 まんこい", content: "奄美大島の焼酎でソーダ割りにするとずっと飲める", comment: "効くーーー")

user = User.find_by(name: "カイ")
user.drinks.create(title: "レモンティーマルガリータ", content: "市販のレモンティーにジンジャーエールをテキーラを混ぜて作ります。", comment: "紅茶好きな方にもお勧めなカクテルです")


# Food
user = User.find_by(name: "ちっぞう")
user.foods.create(title: "ししとうのニンニク炒め", content: "フライパンに火を付けてししとうをそのまま入れるだけ。味付けは塩とガーリックパウダーで", comment: "調理が簡単でカロリーもほぼ0なので気軽に食べられます")
user.foods.create(title: "大阪堂のマヨたこ", content: "大阪堂というお店のたこ焼きです。マヨネーズが中に入っていてうまい", comment: "全国展開しているようなので、お近くにあればぜひに")
user.foods.create(title: "CRATZ", content: "グリコが出しているおつまみです。", comment: "ビールに最強に合うのはもちろんのこと。他のドリンクへの合わせ方も教えて欲しいです！")
user.foods.create(title: "手作りハンバーガー", content: "めんどくさかったらパンに買ってきたハンバーグを挟むだけでも充分です。パンを焼くことだけはして欲しい。オーブンが無ければフライパンに乗せて弱火にかけてもおっけー", comment: "あまりハンバーガーを自分で作ることは少ないと思いますが、レトルトを使ってもいいので自分で作ると倍はうまいです")

user = User.find_by(name: "カイ")
user.foods.create(title: "ニラたま和え", content: "ニラをさっとゆでて卵黄を合わせる。味付けはめんつゆとかごま油とかで適当にしとけば大概うまい。", comment: "かなり簡単なので、だれでもできる、はず")
user.foods.create(title: "6Pチーズ", content: "コンビニでどこでも売っていて、とくにブルーベリー味のチーズケーキの様な品がおすすめ", comment: "6Pチーズはチーズ単体で食べやすくなってるので、おつまみとして優秀")

user = User.find_by(name: "ケンタ")
user.foods.create(title: "砂肝のポン酢和え", content: "砂肝をさっとゆでてポン酢で合えればすぐにツマミができます、安い", comment: "")
user.foods.create(title: "牛タンジャーキー", content: "味の牛たん 喜助、というところが出しているジャーキーです！", comment: "なかなか食べることのない牛タンのジャーキー、ぜひ一度")


# Pairing
user = User.find_by(name: "ちっぞう")
drink = Drink.find_by(title: "サングリアのノンアルバージョン")
food = Food.find_by(title: "6Pチーズ")
user.pairings.create(title: "赤ワインとチーズは合いますが、ノンアルでも一緒！", drink_id: drink.id, food_id: food.id, comment: "子供と一緒につまんだりしています")
drink = Drink.find_by(title: "TECATE")
food = Food.find_by(title: "CRATZ")
user.pairings.create(title: "CRATZに合わせるビールをTECATEに", drink_id: drink.id, food_id: food.id, comment: "あまり見かけないビールと合わせて、いつもの晩酌を少しリッチにしてくれます")
drink = Drink.find_by(title: "TECATE")
food = Food.find_by(title: "手作りハンバーガー")
user.pairings.create(title: "気分は外国、最強", drink_id: drink.id, food_id: food.id, comment: "家でこれがしたらめちゃくちゃ楽しかったです。ハンバーガーを作ってる時から飲んでました")

user = User.find_by(name: "やまちゃん")
drink = Drink.find_by(title: "黒糖焼酎 まんこい")
food = Food.find_by(title: "ニラたま和え")
user.pairings.create(title: "ニラの強い香りに強めの焼酎を", drink_id: drink.id, food_id: food.id, comment: "つまみもお酒もいくらでも行けます。栄養もいいので、飲み過ぎても問題なし！")
drink = Drink.find_by(title: "カルピスワインソーダ")
food = Food.find_by(title: "6Pチーズ")
user.pairings.create(title: "カルピスソーダワインに合わせてみました", drink_id: drink.id, food_id: food.id, comment: "ワインとチーズが合うならワインのカクテルでもやはり合いました。炭酸ありなのがまたいいです。")

user = User.find_by(name: "とみー")
drink = Drink.find_by(title: "ゼロキロコークハイ")
food = Food.find_by(title: "ししとうのニンニク炒め")
user.pairings.create(title: "ほぼ0カロリーの組み合わせ", drink_id: drink.id, food_id: food.id, comment: "どちらもカロリーがほぼ0なので、意外とヘルシー。ニンニクのパンチもコークハイによく合います")

user = User.find_by(name: "たけるネス")
drink = Drink.find_by(title: "レモンティーマルガリータ")
food = Food.find_by(title: "牛タンジャーキー")
user.pairings.create(title: "人にも自信をもってふるまえる組み合わせ", drink_id: drink.id, food_id: food.id, comment: "牛タンジャーキーを食べたことなかったので、取り寄せて食べてみました。マルガリータにも合いました～")

user = User.find_by(name: "カイ")
drink = Drink.find_by(title: "レモンティーマルガリータ")
food = Food.find_by(title: "ししとうのニンニク炒め")
user.pairings.create(title: "意外とマルガリータに合うししとう", drink_id: drink.id, food_id: food.id, comment: "和な味と洋の香りが意外と合います。だまされたと思って一回やってみて。")
