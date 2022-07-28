class UsersController < ApplicationController
  before_action :authenticate_user!

  # Friendship Requests Methods
  def show
    @user = User.eager_load(:sent_requests,:received_requests,
                          posts: [:rich_text_body, :user_likes, :comments],
                          avatar_attachment: :blob)
                          .find(params[:user_id])
  end

  def index
    @users = User.includes([avatar_attachment: :blob]).all
  end

  def friends
    @user = User.find(params[:user_id])
    if @user == current_user
      @friends = User.includes([avatar_attachment: :blob])
                      .find(current_user.active_friends.map(&:id))
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendships page."
    end
  end

  def received_requests
    @user = User.find(params[:user_id])
    if @user == current_user
      @received_requests = current_user
                          .received_requests
                          .includes(user: [avatar_attachment: :blob])
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendship requests page."
    end
  end

  def sent_requests
    @user = User.find(params[:user_id])
    if @user == current_user
      @sent_requests = current_user
                      .sent_requests
                      .includes(friend: [avatar_attachment: :blob])
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendship requests page."
    end
  end
end
