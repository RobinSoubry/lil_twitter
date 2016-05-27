class CreateUsersTweets < ActiveRecord::Migration
  def change
    create_join_table :users, :tweets
  end
end
