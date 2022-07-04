class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friendship Request successfully created.'
    end
    redirect_to users_sent_requests_path(current_user.id)
  end

  def update
    @friendship = set_friendship
    if @friendship.update_attribute('status', params[:status])
      flash[:notice] = 'Friendship successfully accepted.'
      redirect_to users_friends_path(current_user.id)
    end
  end

  def destroy
    @friendship = set_friendship
    @friendship.destroy
    if @friendship.destroy
      flash[:notice] = 'Friendship successfully destroyed.'
      redirect_to users_profile_path(current_user.id)
    end
  end

  private
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
