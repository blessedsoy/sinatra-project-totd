
class CommentsController < ApplicationController 

  # post '/comments/:id/' do
  #   binding.pry
  #   if session[:id] != nil

  #     @user = User.find_by_id(session[:id])
  #     @topic = Topic.find_by_id(params[:id])
  #     if !params[:content].empty?
  #       @comment = Comment.create(content: params[:content], user_id: @user.id, topic_id: @topic.id)
  #     redirect to "/topics/#{@topic.id}"
  #     else
  #       redirect to '/topics'
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end


  # get '/comments/:id/' do
  #   binding.pry
  #   if session[:id] != nil
  #     @user = User.find_by_id(session[:id])
  #     @comment = Comment.find(params[:id])
  #     # @topic = Topic.find_by_id(params[:id])
  #     # @comment = Comment.find(content: params[:content], user_id: @user.id, topic_id: @topic.id)
  #     erb :'topics/show_topic'
  #   else
  #     redirect to '/login'
  #   end
  # end

  # get '/comments/:id/edit' do
  #   binidng.pry
  #   if session[:id] != nil
  #     @user = User.find_by_id(session[:id])
  #     binding.pry
  #     @comment = Comment.find_by_id(params[:id])
  #     erb :'topics/show_topic'
  #   else
  #     redirect to '/login'
  #   end
  # end


  # post '/comments/:id/edit' do
  #   @user = User.find_by_id(session[:id])
  #   @comment = Comment.find(params[:id])
  #   if !params[:content].empty? && @comment.user_id == @user.id
  #     @comment.update(content: params[:content])
  #     @user.comment << @comment
  #     @user.save
  #     redirect "/topics/#{@comment.topic_id}"
  #   else
  #     redirect "/comments/#{@comment.id}/edit"
  #   end
  # end

  # post '/comments/:id/delete' do
  #   @comment = Comment.find(params[:id])
  #   @topic = Topic.find(@comment.topic_id)
  #   if !session[:id].nil? && @comment.user_id == session[:id]
  #     @comment.delete(params[:id]) 
  #     @topic.comments.delete(params[:id])
  #     redirect to "/topics/#{@topic.id}"
  #   else
  #     redirect '/topics'
  #   end
  # end

  # get '/comments' do
  #   if !session[:id].nil?
  #    redirect to '/topics'
  #   else
  #    redirect to '/login'
  #  end
  # end

  # post '/comments' do
  #   if session[:id] != nil
  #     @user = User.find_by_id(session[:id])
  #     @post = Post.find_by_id(params[:id])
  #     if !params[:content].empty?
  #       @comment = Comment.create(content: params[:content], user_id: @user.id, post_id: @post.id)
  #       @comment.user = @user
  #       @comment.save
  #     redirect to "/comments/#{@comment.id}"
  #     else
  #       redirect to '/comments'
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end


  # get '/comments/:id' do
  #   if session[:id] != nil
  #     @user = User.find_by_id(session[:id])
  #     @post = Post.find_by_id(params[:id])
  #     @comment = Comment.find_by_id(params[:id])
  #     erb :'topics/show_topic'
  #   else
  #     redirect to '/login'
  #   end
  # end


  # get '/tweets/:id/edit' do
  #   if session[:id] != nil
  #     @user = User.find_by_id(session[:id])
  #     @tweet = Tweet.find_by_id(params[:id])
  #     erb :'tweets/edit_tweet'
  #   else
  #     redirect to '/login'
  #   end
  # end


  # post '/comments/:id' do
  #   @user = User.find_by_id(session[:id])
  #   @tweet = Tweet.find(params[:id])
  #   if !params[:content].empty? && @tweet.user_id == @user.id
  #     @tweet.update(content: params[:content])
  #     @user.tweets << @tweet
  #     @user.save
  #     redirect "/tweets/#{@tweet.id}"
  #   else
  #     redirect "/tweets/#{@tweet.id}/edit"
  #   end
  # end

  # post '/tweets/:id/delete' do
  #   @tweet = Tweet.find(params[:id])
  #   if !session[:id].nil? && @tweet.user_id == session[:id]
  #     Tweet.delete(params[:id]) 
  #     redirect to'/tweets'
  #   else
  #     redirect "/tweets/#{@tweet.id}"
  #   end
  # end


end
