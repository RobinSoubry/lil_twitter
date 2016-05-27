class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  # belongs_to :users_tweet
  belongs_to :user, foreign_key: :tweeter_id
end
