class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    binding.pry
    @comment = @post.comments.new
  end
  
  def create
    raise "satan"
  end
end