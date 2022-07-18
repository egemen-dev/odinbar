class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

  def index
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
      flash[:notice] = 'Post successfully created.'
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully deleted.'

    redirect_to root_path, status: :see_other
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # Only allow post owner to edit
    if @post.user == current_user
      if @post.update(post_params)
        redirect_to @post
        flash[:notice] = 'Post successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end

