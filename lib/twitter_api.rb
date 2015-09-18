class TwitterApi
	def self.our_public_tweets
		client.user_timeline("Conservingearth)
	end

	def self.client
	  @client ||= Twitter::REST::Client.new do |config|
	  config.consumer_key        = "FjhHRv5uza0Eo5zbMKJ0b3EcI"
	  config.consumer_secret     = "Cu4bsUbPcsWGImgNh4loQ4w1iCJbGjfdvsPikTV4wCsOmbYruS"
	end
	end
end
