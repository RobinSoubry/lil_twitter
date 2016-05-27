require 'faker'
require 'securerandom'

#1.) Check for Faker in the Gem File
#2.) Require Faker in the Seed File
#3.) Retrieve Faker Here: https://github.com/stympy/faker

Tweet.delete_all
Friendship.delete_all
User.delete_all

300.times do
  Tweet.create(
    body: Faker::Book.title,
    tweeter_id: rand(1..100)
    )
end

100.times do
  Friendship.create(
    leader_id: rand(1..100),
    follower_id: rand(1..100)
    )
end

20.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "1234"
    )
end
