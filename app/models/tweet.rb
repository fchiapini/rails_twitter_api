class Tweet < ActiveRecord::Base
	validates :user_name, :text, :posted_at, :twitter_id, presence: true
	validates :twitter_id, uniqueness: { case_sensitive: false }
end
