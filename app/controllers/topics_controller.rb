require 'pry'
class TopicsController < ApplicationController 

  get '/topics' do
    if !session[:id] 
      flash[:message] = "Please log in"
      redirect to '/login'
    else
      @user = User.find(session[:id])
      @topics = Topic.all
      erb :"topics/topics"
    end
  end


  get '/topics/:id' do
    if logged_in?
      @user = User.find_by_id(session[:id])
      @topic = Topic.find_by_id(params[:id])
      erb :'topics/show_topic'
    else
      redirect to '/login'
    end
  end

  post '/topics/:id/comment' do

    if logged_in?
      @user = User.find_by_id(session[:id])
      @topic = Topic.find_by_id(params[:id])
      if !params[:content].empty?
        @comment = Comment.create(content: params[:content], user_id: @user.id, topic_id: @topic.id)
      redirect to "/topics/#{@topic.id}/comment"
      else
        redirect to '/topics'
      end
    else
      redirect to '/login'
    end
  end


  get '/topics/:id/comment' do
    if logged_in?
      @user = User.find_by_id(session[:id])
      @topic = Topic.find_by_id(params[:id])
      erb :'topics/show_topic'
    else
      redirect to '/login'
    end
  end

  get '/comments/:id/edit' do
    if logged_in?
      @user = User.find_by_id(session[:id])
      @comment = Comment.find_by_id(params[:id])
      @topic = Topic.find(@comment.topic_id)

      erb :'topics/show_topic'
    else
      redirect to '/login'
    end
  end


  post '/comments/:id/edit' do
    @user = User.find_by_id(session[:id])
    @comment = Comment.find(params[:id])
    @topic = Topic.find(@comment.topic_id)
    if !params[:content].empty? && @comment.user_id == @user.id
      @comment.update(content: params[:content])
      redirect "/topics/#{@comment.topic_id}"
    else
      redirect "/comments/#{@comment.id}/edit"
    end
  end

  post '/comments/:id/delete' do
    @comment = Comment.find(params[:id])
    @topic = Topic.find(@comment.topic_id)
    if logged_in? && @comment.user_id == session[:id]
      @comment.delete
    end
      redirect to "/topics/#{@topic.id}"
  end



end
