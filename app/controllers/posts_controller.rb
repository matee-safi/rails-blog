class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
    @user.posts_counter = User.find(params[:user_id]).posts.count
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])
  end
end
