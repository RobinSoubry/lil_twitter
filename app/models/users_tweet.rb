class UsersTweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :tweet
  has_many :tweets
  has_many :users
end
