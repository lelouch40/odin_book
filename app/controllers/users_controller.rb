class UsersController < ApplicationController
	before_filter :authenticate_user!
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
     if @user.update_attributes
     	redirect_to root_url
     else
     	render("edit")
     end
  end
end
