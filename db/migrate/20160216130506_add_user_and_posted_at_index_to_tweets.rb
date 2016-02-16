class AddUserAndPostedAtIndexToTweets < ActiveRecord::Migration
  def change
  	add_index :tweets, :user
  	add_index :tweets, :posted_at
  end
end
