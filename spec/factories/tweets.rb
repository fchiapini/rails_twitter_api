FactoryGirl.define do
  factory :tweet do
    user "@felipe"
    text "My first tweet!"
    posted_at Time.now
    twitter_id 1
  end
end
