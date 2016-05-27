class CreateUsersTweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :retweeter, foreign_key: :retweeter_id, class_name: 'User'
  belongs_to :tweet
end
