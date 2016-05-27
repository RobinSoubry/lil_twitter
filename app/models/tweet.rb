class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tweeter, foreign_key: :tweeter_id, class_name: 'User'
  has_many :retweets, foreign_key: :retweeter_id, class_name: 'user_tweets'
end
