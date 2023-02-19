# frozen_string_literal: true

class PostLiking < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :post
end
