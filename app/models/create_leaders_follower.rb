class CreateLeadersFollower < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :leader, foreign_key: :leader_id, class_name: 'User'
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
end
