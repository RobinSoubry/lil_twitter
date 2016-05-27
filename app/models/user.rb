class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :friendships
  has_many :followers, through: :friendships, source: :follower

  # To Do
  has_many :users_tweets
  has_many :tweets, through: :users_tweets
end
