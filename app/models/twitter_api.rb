
require 'pry'
require 'twitter'
class TwitterApi 

attr_reader :attrs

  
  def initialize
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "rTVosgIsGdBBWkNVWdQTCvnhX"
      config.consumer_secret = "kMOv4hXBgTUtMhwJ8YY4vO5yke2SATDpYQGW8Bno1GkREYxCZr"
      config.access_token = "757633724930527233-72UIxJb2jjtlkff3SiePwyvc0jPIYbH"
      config.access_token_secret = "OzDs07PWzRiIEkxYy9G7zg2VUVhgmDzuC6asEwbjYb76Y"
    end
  end

  def top_10_trends
    # @result = [{name: "a", url: "http://a"},{name: "b", url: "http://b"},{name: "c", url: "http://c"}]

    # @result.each do |h|
    #   Topic.create(name: h[:name], url: h[:url])
    # end
    tweet_trends = @client.trends(id=23424977, options = {})
    @result = tweet_trends.attrs[:trends].delete_if { |data| data[:tweet_volume].nil? }
    @result = tweet_trends.attrs[:trends].sort {|a, b| b[:tweet_volume] <=> a[:tweet_volume]}[0..9]

    @result.each do |trend|
      trend[:name] = '#' + trend[:name] if trend[:name].first != '#'

     Topic.create(name: trend[:name], url: trend[:url])
    end
  end



end