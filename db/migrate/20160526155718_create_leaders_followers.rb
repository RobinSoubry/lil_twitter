class CreateLeadersFollowers < ActiveRecord::Migration
  def change
    create_table :leaders_followers do |t|
      t.integer :leader_id, null:false
      t.integer :follower_id, null:false
    end
  end
end
