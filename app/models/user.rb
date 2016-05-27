class User < ActiveRecord::Base
  # Remember to create a migration!

  # Retrieve individual entries from join table 'users_follower'
  # ============================================================
  # Tell me all the leader/follower pairs for which i'm a leader
  has_many :followers_as_leader, class_name: 'LeadersFollower', foreign_key: :follower_id
  # Tell me all the leader/follower pairs for which i'm a follower
  has_many :leaders_as_follower, class_name: 'LeadersFollower', foreign_key: :leader_id

  # Retrieve actual users based on join table 'users_followers' results (see above)
  # ===============================================================================
  has_many :followers, through: :followers_as_leader, foreign_key: :follower_id
  has_many :leaders, through: :leaders_as_follower, :foreign_key => :leader_id

  # GRAB FIRST DEGREE TWEETS
  # Retrieve all tweets for a specific user
  # =======================================
  has_many :tweets, :foreign_key => :tweeter_id

  # GRAB SECOND DEGREE TWEETS
  # Retrieve all re-tweeters(users) for a specific tweet
  # Is also SELECT users.username
      # FROM tweets
      # JOIN user_tweets ON tweets.id = users_tweets.tweet.id
      # JOIN users ON users_tweets.retweeter_id = users.id
      # WHERE users_tweets = tweet_id;
  has_many :retweets_as_post, class_name: 'UsersTweet', foreign_key: :tweet_id
  has_many :retweeters, through: :retweets_as_post, foreign_key: :tweeter_id
end
