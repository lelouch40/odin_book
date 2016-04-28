class UsersController < ApplicationController
	before_filter :authenticate_user!
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
		render("edit")
end
end
  def follow
    @user = User.find(params[:id])
    if @user == current_user
    	raise ArgumentError, "You can't follow yourself"
    else
    current_user.follow!(@user)
    redirect_to(:action=>"index")
  end
end
    def unfollow
    	    	    @user = User.find(params[:id])
    	    if @user == current_user
    	raise ArgumentError, "You can't unfollow your self"
    else
    current_user.unfollow!(@user)
        redirect_to(:action=>"index")
  end
end
def user_params
	params.require(:user).permit(:username,:email,:avatar,:password)
end
end