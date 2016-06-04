class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
		      helper_method :edit
	def index
		@user=User.all
	end
	def show
			@user=User.find(params[:id])
	end
		def edit
		@user=User.find(params[:id])
		end
	def update
	@user=User.find(params[:id])
	if @user.update_attributes(user_params)
		flash[:sucess]="Edited"
		redirect_to(:action=>"index")
	else
				flash[:notice]="Error"
		render("edit")
end
end
def friend_request
  user_id = current_user.id
  friend_id = params[:id] # this is the id of the user you want to become friend with
  @friendable = Friendship.create(user_id: user_id, friend_id: friend_id, accepted: false)
end
def friends
	@user=User.find(params[:id])
	@firends=@user.friends && @user.otherfriendships
	end
	  def likers
  	@likes=Post.find(params[:id])
	end
private
def user_params
	params.require(:user).permit(:username,:email,:avatar,:password)
end
end