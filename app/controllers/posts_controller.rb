class PostsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@post=Post.all
	end
	def new
		@post=Post.new
	end
	def create
		@post=current_user.posts.build(post_params)
		if @post.save
		redirect_to(:controller=>"users",:action=>"index")
		flash[:sucess]="Created post"
	else
				render "new"
				flash[:error]= "Something went wrong"
end
end
def show
			@post=Post.find(params[:id])
		end
def post_params
params.require(:post).permit(:description)
end
end
