class PostsController < ApplicationController
	before_filter :authenticate_user!
	    load_and_authorize_resource :except=>[:new,:create,:show]
	      helper_method :show,:index
	def index
      @posts = Post.subscribed current_user.following
	@comment=Comment.new
	end
	def new
		@post=Post.new
	end
	def create
		@post=current_user.posts.build(post_params)
		if @post.save
		redirect_to root_url
		flash[:sucess]="Created post"
	else
				render "new"
				flash[:error]= "Something went wrong"
		end
		end
		def show
		@post=Post.find(params[:id])
		end
				private
def post_params
params.require(:post).permit(:description)
end
end
