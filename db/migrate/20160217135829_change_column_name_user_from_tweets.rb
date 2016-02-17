class ChangeColumnNameUserFromTweets < ActiveRecord::Migration
  def change
  	rename_column :tweets, :user, :user_name
  end
end
