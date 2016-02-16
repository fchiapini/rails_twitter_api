class AddColumnTwitterIdToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :twitter_id, :string
  end
end
