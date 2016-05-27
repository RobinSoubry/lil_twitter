class CreateUsersTweets < ActiveRecord::Migration
  def change
    create_table :users_tweets do |t|
      t.integer :retweeter_id
      t.integer :tweet_id
    end
  end
end
