# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.limit(100)
  end

  def destroy_all
    return unless current_user.notifications.destroy_all

    redirect_to posts_path
  end
end
