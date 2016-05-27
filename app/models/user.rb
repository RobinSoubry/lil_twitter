class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :friendships
  has_many :followers, through: :friendships, source: :follower

end
