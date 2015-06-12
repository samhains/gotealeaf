class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Comment has been saved!"
      redirect_to @post 
    else
      render 'posts/show'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end