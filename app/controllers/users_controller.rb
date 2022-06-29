class UsersController < ApplicationController
  before_action :authenticate_user!

  # Friendship Requests Methods
  def friends
    @friends = current_user.active_friends
  end

  def received_requests
    @received_requests = current_user.received_requests
  end

  def sent_requests
    @sent_requests = current_user.sent_requests
  end
end
