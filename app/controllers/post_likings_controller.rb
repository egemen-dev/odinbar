class PostLikingsController < ApplicationController
  before_action :authenticate_user!

  def create
    if PostLiking.where(user: current_user, post_id:params[:post_id]).empty?
      @post_liking = PostLiking.create(user: current_user, post_id:params[:post_id])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "likeable_post_#{@post_liking.post.id}",
            partial: 'posts/likesection',
            locals: { post: @post_liking.post }
          )
        end
      end
    end
  end

  def destroy
    @post_liking = PostLiking.find_by(user: current_user, post_id:params[:id])
    unless @post_liking.nil?
      @post_liking.destroy 
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "likeable_post_#{@post_liking.post.id}",
            partial: 'posts/likesection',
            locals: { post: @post_liking.post }
          )
        end
      end
    end
  end
end
