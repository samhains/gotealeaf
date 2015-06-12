class PostsController < ApplicationController
  before_action :find_post_by_id, only: [:show, :edit, :update] 

  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.creator = @user

    if @post.save
      flash[:notice] = "Post Has Been Saved"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  
    if @post.update(post_params)
      flash[:notice] = "Post Updated!"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :user_id, :category_ids => [])
  end
  def find_post_by_id
    @post = Post.find(params[:id])
  end
end
