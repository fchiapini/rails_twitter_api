class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.text :text
    	t.string :user
    	t.datetime :posted_at
    	t.integer :twitter_id

      t.timestamps null: false
    end
  end
end
