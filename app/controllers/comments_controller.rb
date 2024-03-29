# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment.destroy if @comment.user == current_user
    redirect_to post_path(@comment.post)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
