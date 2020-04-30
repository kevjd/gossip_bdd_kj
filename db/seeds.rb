# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all

10.times do
  City.create(
    name: Faker::Games::Fallout.unique.location,
    zip_code: Faker::Address.unique.zip
  )
end

first_city_id = City.first.id
last_city_id = City.last.id


10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.matz,
    email: Faker::Internet.unique.email,
    age: rand(18..77),
    city: City.find(rand(first_city_id..last_city_id))
  )
end

first_user_id = User.first.id
last_user_id = User.last.id


20.times do
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Quote.robin,
    user: User.find(rand(first_user_id..last_user_id))
  )  
end

first_gossip_id = Gossip.first.id
last_gossip_id = Gossip.last.id
