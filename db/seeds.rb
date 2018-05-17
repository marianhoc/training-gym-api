# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do
  v = Video.new
  v.url = 'kizame-karate.com/video/' + Faker::Internet.password(12)
  v.titulo = Faker::Hobbit.character
  v.save
end

20.times do
  u = User.new
  u.name = Faker::Name.name
  u.email = Faker::Internet.email
  u.password = '12345'
  u.password_confirmation = '12345'
  u.age = Faker::Number.digit + Faker::Number.digit
  u.save
end