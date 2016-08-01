
class UsersController < ApplicationController 

  get '/signup' do  
    if !session[:id] 
      erb :'users/create_user'
    else 
      redirect to '/topics'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email]== "" || params[:password] == ""
      flash[:message] = "Please fill out all fields"
      redirect to "/signup"
    else
      user = User.create(username: params[:username], email: params[:email], password: params[:password]) 
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
      redirect to '/signup'
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
