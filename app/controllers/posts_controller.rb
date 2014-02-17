class PostsController < ApplicationController
  
  http_basic_authenticate_with name: "katy", password: "nicholas", except: [:index, :show]
  def index
    @posts = Post.all
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
      flash[:info] = "Success!"
    else
      flash[:error] = "ERROR: #{post.errors.full_messages.to_sentence}"
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
