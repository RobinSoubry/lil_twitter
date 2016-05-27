class CreateLeadersFollowers < ActiveRecord::Migration
  def change
    create_table :leaders_followers do |t|
      t.integer :leader_id
      t.integer :follower_id
    end
  end
end
