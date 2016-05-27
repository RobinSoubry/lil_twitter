class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :friendships_as_leader, class_name: 'Friendship', foreign_key: :leader_id
  has_many :friendships_as_follower, class_name: 'Friendship', foreign_key: :follower_id
  has_many :followers, through: :friendships_as_leader
  has_many :leaders, through: :friendships_as_follower

  has_many :tweets, foreign_key: :tweeter_id

  validates :username, :email, :password_hash, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password)
    self.password == password
  end

  def list_tweets_i_follow(user_list)
    tweets = user_list.map! { |user| user.tweets}
  end

end
