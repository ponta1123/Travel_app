class Admin::PostsController < ApplicationController

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin__path
  end


end
