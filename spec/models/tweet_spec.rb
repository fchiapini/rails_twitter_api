require 'spec_helper'

describe Tweet do
  before { @tweet = FactoryGirl.build( :tweet ) }

  subject { @tweet }
  
  it { should respond_to( :user ) }
  it { should respond_to( :text ) }
  it { should respond_to( :posted_at ) }
  it { should respond_to( :twitter_id ) }

  it { should be_valid }
end
