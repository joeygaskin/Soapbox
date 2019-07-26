class CommentsController < ApplicationController

  def create
    @comment = @post.comments.create(comments_params)
    @post = Post.find(params[:post_id])
    redirect_to post_path(@post)
  end

  private def comments_params
    params.require(:comment).permit(:username, :body)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
