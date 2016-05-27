class Friendship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :follower, class_name: 'User'
  belongs_to :user
end
