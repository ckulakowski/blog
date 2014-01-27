class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def comment
    Post.find(params[:id]).comments.create(params[:comment])
    flash[:notice] = "Added your comment"
    redirect_to :action => "show", :id => params[:id]
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    
    if post.update_attributes(post_params)
      flash[:info] = 'Post successfully updated!'
    else
      flash[:error] = 'fail town'
    end
    
    redirect_to post_path(post)
  end
  
  def create
    post = Post.new(post_params)
    
    if post.save
      flash[:info] = "ERROR: #{post.errors.full_messages.to_sentence}"
    else
      flash[:error] = 'fail town'
    end
    
    redirect_to post_path(post)
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :title)
  end
end
