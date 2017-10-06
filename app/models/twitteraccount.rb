class Twitteraccount
  attr_reader :client, :user_name

  def initialize
    @user_name = ENV["TWITTER_USER"]

    @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
      end
  end

  def tweet
    tweet_array = []
    @client.user_timeline(@user_name).each do |tweet|
        tweet_array << tweet.text if tweet.is_a?(Twitter::Tweet)
      end
    tweet_array.sample
  end
end
