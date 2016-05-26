class CreateUsersTweets < ActiveRecord::Migration
  def change
    create_table :users_tweets do |t|
      t.integer :retweeter_id, null: false
      t.integer :tweet_id, null: false
    end
  end
end
