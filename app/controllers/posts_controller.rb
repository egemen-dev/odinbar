class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = set_post
  end

  def index
    # Returns all posts of all the current_user’s friends along with the curren_user’s post.
    @posts = []
    current_user.active_friends.each do |friend|
      Post.where(user: friend).each do |post|
        @posts << post
      end     
    end
    current_user.posts.each do |post|
      @posts << post
    end
    @posts = @posts.sort_by(&:created_at).reverse
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
    if @post.user == current_user
      @post.destroy
      redirect_to root_path, status: :see_other
    end
  end

  def edit
    @post = set_post
  end

  def update
    @post = set_post
    # Only allow post owner to edit
    if @post.user == current_user
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end

    def set_post
      @post = Post.includes(:user, :user_likes).find(params[:id])
    end
end

