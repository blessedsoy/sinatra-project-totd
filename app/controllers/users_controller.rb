require 'rack-flash'
require 'pry'
class UsersController < ApplicationController 

  get '/signup' do  
    if !session[:id] 
      flash[:message] = "Please sign up before you log in"
      erb :'users/create_user' 
    else 
      redirect to '/topics'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email]== "" || params[:password] == ""
      flash[:message] = "Please fill out all fields"
      erb :'users/create_user'
    elsif User.find_by(username: params[:username]) 
      flash[:message] = "The User Name is already taken."
      erb :'users/create_user'
    else
      user = User.new(username: params[:username], email: params[:email], password: params[:password]) 
      if user.save
        session[:id] = user.id
        redirect to "/topics"
      else 
        redirect to "/signup"
      end 
    end
  end

  get '/login' do
    if session[:id] != nil
      redirect to '/topics'
    else
      erb :'users/login'
    end
  end


  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      flash[:message] = "You are successfully logged in"
      redirect to '/topics'
    else 
      flash[:message] = "Invalid Login, Try again."
      redirect to "/signup"
    end
  end


  get "/logout" do
    if session[:id] != nil
      session.clear
      redirect to '/login'
    else 
      redirect to "/topics"
    end
  end

  get '/users/:slug' do
    user = User.create_by_slug(params[:slug])
    erb :'users/show'
  end

end
