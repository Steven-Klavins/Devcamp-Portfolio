module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_TOKEN_SECRET")
    end

    client.search("#coding", result_type: 'recent', tweet_mode: 'extended').take(6).collect do |tweet|
        if tweet.truncated? && tweet.attrs[:extended_tweet]
    "#{tweet.user.screen_name}: #{tweet.attrs[:extended_tweet].full_text}" 
else
    # REST API with extended mode, or untruncated text in Streaming API
    "#{tweet.user.screen_name}: #{tweet.full_text}" 
end
    end
  end
end


