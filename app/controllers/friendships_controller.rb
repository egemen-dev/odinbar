class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1 or /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  def accept
  end

  # POST /friendships or /friendships.json
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friendship Request was successfully created.'
    else
      flash[:alert] = 'Something went wrong, try again later.'
    end
    redirect_to users_sent_requests_path(current_user.id)
  end

  # PATCH/PUT /friendships/1 or /friendships/1.json
  def update
    @friendship = set_friendship
    if @friendship.update_attribute('status', params[:status])
      flash[:notice] = 'Friendship Request was successfully accepted.'
      redirect_to users_friends_path(current_user.id)
    else
      flash[:alert] = 'Something went wrong, try again later.'
      redirect_to users_friends_path(current_user.id)
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship = set_friendship
    @friendship.destroy
    if @friendship.destroy
      flash[:notice] = 'Friendship Request was successfully destroyed.'
      redirect_to users_profile_path(current_user.id)
    else
      flash[:alert] = 'Something went wrong, try again later.'
      redirect_to users_profile_path(current_user.id)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:friend_id, :status, :sender_id)
  end
end
