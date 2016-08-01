require './config/environment'
require 'rack-flash'

require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/'
    enable :sessions
    set :session_secret, "fwitter_secret"
    use Rack::Flash
  end

  get '/' do 
    @topics = Topic.all 
    erb :index
  end

  # get '/twitter_today' do
  #   @twitter_today = TwitterApi.new
  #   @twitter_today.top_10_trends
  #   redirect "/"
  # end


  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end

end