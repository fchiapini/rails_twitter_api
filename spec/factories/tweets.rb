FactoryGirl.define do
  factory :tweet do
    user_name "@felipe"
    text "My first tweet!"
    posted_at Time.now
    twitter_id 1
  end
end
