class UsersTweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user, foreign_key: :retweeter_id, class_name: 'User'
  belongs_to :tweet, foreign_key: :tweeter_id
end
