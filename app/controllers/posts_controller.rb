# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = set_post
  end

  def index
    @posts = Post.eager_load(:rich_text_body, :user_likes, :comments,
                             user: [avatar_attachment: :blob])
                 .where(user: current_user.bubble)
                 .sort_by(&:created_at)
                 .reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Only allow to delete if post belongs to current user
    @post = set_post
    return unless @post.user == current_user

    @post.destroy
    redirect_to root_path, status: :see_other
  end

  def edit
    @post = set_post
  end

  def update
    @post = set_post
    # Only allow post owner to edit
    return unless @post.user == current_user

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.eager_load(:user, :user_likes).find(params[:id])
  end
end
