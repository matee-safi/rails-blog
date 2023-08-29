class LikesController < ApplicationController
  def create
    @post = Post.includes(:author).find_by(id: params[:post_id])
    @like = @post.likes.new(author: current_user)

    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: 'Liked!'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Unable to like this post'
    end
  end
end
