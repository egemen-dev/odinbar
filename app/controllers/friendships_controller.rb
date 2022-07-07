class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friendship Request successfully created.'
    else
      flash[:alert] = 'Something went wrong, try again later.'
    end
    redirect_to user_sent_requests_path(current_user.id)
  end

  def update
    @friendship = set_friendship
    if @friendship.update_attribute('status', params[:status])
      flash[:notice] = 'Friendship successfully accepted.'
    else
      flash[:alert] = 'Something went wrong, try again later.'
    end
    redirect_to user_friends_path(current_user.id)
  end

  def destroy
    @friendship = set_friendship
    @friendship.destroy
    if @friendship.destroy
      flash[:notice] = 'Friendship successfully destroyed.'
    else
      flash[:alert] = 'Something went wrong, try again later.'
    end
    redirect_to user_profile_path(current_user.id)
  end

  private
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
