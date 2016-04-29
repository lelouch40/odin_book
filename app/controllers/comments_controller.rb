class CommentsController < ApplicationController
  before_filter :authenticate_user!
	def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
 end
	def create
    @post = Post.find(params[:post_id])
  @comment = @post.comments.build(comment_params)
  @comment.user_id = current_user.id #or whatever is you session name
  if @comment.save
    redirect_to @post
  else
    render("new")
    flash.now[:danger] = "error"
  end
 end
 def comment_params
 params.require(:comment).permit(:reply)

 end
end
