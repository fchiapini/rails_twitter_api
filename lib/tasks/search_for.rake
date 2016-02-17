namespace :search_for do
  desc "search for the average of tweets per hour"
  task average_tweets_per_hour: :environment do
  	@tweets = Tweet.find_by_sql("SELECT the_hour, avg(the_count) AS tweets 
  		                           FROM (SELECT (date_part('day', posted_at)) AS the_day, (date_part('hour', posted_at)) AS the_hour, COUNT(*) AS the_count 
  		                           	     FROM tweets GROUP BY the_day, the_hour) t
  		                           GROUP BY the_hour
  		                           ORDER BY the_hour ASC")
  	@tweets.each do | tweet | 
  		puts "#{tweet['the_hour'].to_i}" + " horas -> " + "#{tweet['tweets'].to_i}" + " tweets"
  	end
  end

  desc "search for the user with the biggest number of tweets"
  task first_user_in_number_of_tweets: :environment do
  	@tweets = Tweet.find_by_sql ("SELECT user_name, COUNT(user_name) AS tweets 
  	                             FROM tweets
  	                             GROUP BY user_name
  	                             ORDER BY COUNT(user_name) DESC LIMIT 1")
  	@tweets.each do | tweet |
  		puts "#{tweet['user_name']}" + ": " + "#{tweet['tweets'].to_s}" + " tweets"
    end
  end

end