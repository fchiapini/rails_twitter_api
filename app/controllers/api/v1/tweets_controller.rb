class Api::V1::TweetsController < ApplicationController
	respond_to :json

	def show
		respond_with Tweet.find( params[ :id ] )
	end
end
