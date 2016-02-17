class Api::V1::TweetsController < ApplicationController
	respond_to :json

	def show
		respond_with Tweet.find( params[ :id ] )
	end

	def create
		tweet = Tweet.new( tweet_params )
		if tweet.save
			render json: tweet, status: 201, location: [ :api, tweet ]
		else
			render json: { errors: tweet.errors }, status: 422
		end
	end

	private
	
		def tweet_params
			params.require( :tweet ).permit( :user_name, :text, :posted_at, :twitter_id )
		end
end
