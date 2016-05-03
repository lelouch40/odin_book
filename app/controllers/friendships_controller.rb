class FriendshipsController < ApplicationController
def create
  @friendship = current_user.friends.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Added friend."
    redirect_to root_url
  else
    flash[:error] = "Unable to add friend."
    redirect_to :back
  end
end
    def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(accepted: true)
      if @friendship.save
        redirect_to root_url, :notice => "Successfully confirmed friend!"
      else
        redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
      end
    end

def destroy
  @friendship = current_user.friends.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end
end