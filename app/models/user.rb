class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :friendships
  has_many :followers, through: :friendships, source: :follower

  has_many :users_tweets
  has_many :tweets, through: :users_tweets

  validates :username, :email, :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password)
    self.password_hash == password
  end

end
