class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end



  def post_params
    params.require(:post).permit(:title, :introduction, :image, :tourist_spot)
  end
end
