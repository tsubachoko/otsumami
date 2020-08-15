# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
user.drinks.create(title: "生ビール", content: "定番のやつ", comment: "これで間違いなし、大概のおつまみに合います！")
user.drinks.create(title: "モスコミュール", content: "ウォッカをジンジャーエールなどで割ったもの", comment: "甘くなくて飲みやすくて好きですが、合わせ方が分からないので、どなたか宜しくお願いいたします。")
user.drinks.create(title: "水", content: "蛇口をひねれば出る飲み物", comment: "ラーメンにはビールよりも水ではないかという説も")

user = User.find_by(name: "とみー")
user.drinks.create(title: "赤ワイン", content: "渋みをあるが、うまみの強いお酒", comment: "何に合わせたらいいか分かりません")

user = User.find_by(name: "たけるネス")
user.drinks.create(title: "焼酎", content: "主に水割りで飲む", comment: "効くーーー")


# Food
user = User.find_by(name: "ちっぞう")
user.foods.create(title: "たこ焼き", content: "粉もん", comment: "ビール間違いなし、他にも知りたい。")
user.foods.create(title: "醤油ラーメン", content: "締めの一品", comment: "お酒と合わせるというよりは締めの方が一般的かな")
user.foods.create(title: "お刺身", content: "魚はなんでもいい", comment: "飲み物はなんでもあう、調味料次第")

user = User.find_by(name: "カイ")
user.foods.create(title: "チーズ", content: "ミルクが発酵したやつ", comment: "大概合う")

user = User.find_by(name: "ケンタ")
user.foods.create(title: "焼肉", content: "人気で定番の食事", comment: "飲み物よりむしろごはんか？")

# pairing
user = User.find_by(name: "ちっぞう")
drink = Drink.find_by(title: "赤ワイン")
food = Food.find_by(title: "チーズ")
user.pairings.create(title: "赤ワイン×チーズ", drink_id: drink.id, food_id: food.id, comment: "鉄板、文句なかろう？")
drink = Drink.find_by(title: "焼酎")
food = Food.find_by(title: "お刺身")
user.pairings.create(title: "焼酎にお刺身！", drink_id: drink.id, food_id: food.id, comment: "日本酒じゃなくて焼酎ってのもなかなかいいです")
drink = Drink.find_by(title: "生ビール")
food = Food.find_by(title: "焼肉")
user.pairings.create(title: "焼肉にはやっぱしビールよ", drink_id: drink.id, food_id: food.id, comment: "間違いない")

user = User.find_by(name: "とみー")
drink = Drink.find_by(title: "モスコミュール")
food = Food.find_by(title: "チーズ")
user.pairings.create(title: "モスコミュールに合わせるのはチーズ", drink_id: drink.id, food_id: food.id, comment: "チーズならなんでもいけます")

user = User.find_by(name: "たけるネス")
drink = Drink.find_by(title: "水")
food = Food.find_by(title: "焼肉")
user.pairings.create(title: "焼肉は実は水がいい", drink_id: drink.id, food_id: food.id, comment: "ビールでも白米でもなく、水が最強よ")

