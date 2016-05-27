require 'faker'
require 'securerandom'

#1.) Check for Faker in the Gem File
#2.) Require Faker in the Seed File
#3.) Retrieve Faker Here: https://github.com/stympy/faker

Tweet.delete_all
LeadersFollower.delete_all
UsersTweet.delete_all

20.times do
  Tweet.create(
    body: Faker::ChuckNorris.fact,
    tweeter_id: rand(1..5)
    )
end

10.times do
  LeadersFollower.create(
    leader_id: rand(1..5),
    follower_id: rand(1..5)
    )
end

40.times do
  UsersTweet.create(
    retweeter_id: rand(1..5),
    tweet_id: rand(1..20)
    )
end
