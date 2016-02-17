require 'spec_helper'

describe Tweet do
  before { @tweet = FactoryGirl.build( :tweet ) }

  subject { @tweet }
  
  it { should respond_to( :user_name ) }
  it { should respond_to( :text ) }
  it { should respond_to( :posted_at ) }
  it { should respond_to( :twitter_id ) }

  it { should be_valid }

  it { should validate_presence_of( :user_name ) }
  it { should validate_presence_of( :text ) }
  it { should validate_presence_of( :posted_at ) }
  it { should validate_presence_of( :twitter_id ) }
  it { should validate_uniqueness_of( :twitter_id ).case_insensitive }
end
