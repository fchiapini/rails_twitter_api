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
      expect( tweet_response[ :user_name ] ).to eql @tweet.user_name
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before( :each ) do
        @tweet_attributes = FactoryGirl.attributes_for :tweet
        post :create, { tweet: @tweet_attributes }, format: :json
      end

      it "renders the json representation for the tweet record just created" do
        tweet_response = JSON.parse( response.body, symbolize_names: true )
        expect( tweet_response[ :user_name ] ).to eql @tweet_attributes[ :user_name ]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before( :each ) do
        #notice I'm not including the user_name
        @invalid_tweet_attributes = { text: "My first tweet!",
                                      posted_at: Time.now,
                                      twitter_id: 2 }
        post :create, { tweet: @invalid_tweet_attributes }, format: :json
      end

      it "renders an errors json" do
        tweet_response = JSON.parse( response.body, symbolize_names: true )
        expect( tweet_response ).to have_key( :errors )
      end

      it "renders the json errors on why the tweet could not be created" do
        tweet_response = JSON.parse( response.body, symbolize_names: true )
        expect( tweet_response[ :errors ][ :user_name ]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
