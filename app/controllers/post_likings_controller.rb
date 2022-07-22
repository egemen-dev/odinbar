class PostLikingsController < ApplicationController
  before_action :authenticate_user!

  def create
    if PostLiking.where(user: current_user, post_id:params[:post_id]).empty?
      @post_liking = PostLiking.create(user: current_user, post_id:params[:post_id])
      redirect_to @post_liking.post
    end
  end

  def destroy
    @post_liking = PostLiking.find_by(user: current_user, post_id:params[:id])
    @post_liking.destroy
    redirect_to @post_liking.post
  end
end
