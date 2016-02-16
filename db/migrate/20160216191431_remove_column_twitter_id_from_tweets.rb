class RemoveColumnTwitterIdFromTweets < ActiveRecord::Migration
  def change
  	remove_column :tweets, :twitter_id, :integer
  end
end
