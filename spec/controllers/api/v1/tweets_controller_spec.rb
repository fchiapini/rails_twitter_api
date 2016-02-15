require 'spec_helper'

describe Api::V1::TweetsController do
	before( :each ) { request.headers[ 'Accept' ] = "application/vnd.railstwitter.v1" }

  describe "GET #show" do
    before( :each ) do
      @tweet = FactoryGirl.create :tweet
      get :show, id: @tweet.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      tweet_response = JSON.parse( response.body, symbolize_names: true )
      expect( tweet_response[ :user ] ).to eql @tweet.user
    end

    it { should respond_with 200 }
  end
end
