# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(name: "test", email: "test@example.com",
                password: "password",
                password_confirmation: "password")
user.save

user.items.new(type: "Food", title: "food").save

user.items.new(type: "Drink", title: "drink").save

