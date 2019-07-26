class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
#    @comment = @post.comments.new
  end

  def new
    @post = Post.new

  end

  def create
    @post = current_user.posts.new(post_params)
    if (@post.save)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if (@post.update(post_params))
      redirect_to post_path(current_user.username, @post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
