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

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      @current_user ||= User.find(session[:id])
    end
  end

end