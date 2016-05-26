class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :followers, through: :leader_followers
  has_many :leaders, :foreign_key => "leader_id"
  has_many :tweets
  has_many :retweeters
end