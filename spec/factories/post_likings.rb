# frozen_string_literal: true

FactoryBot.define do
  factory :post_liking do
    post_id { 1 }
    user_id { 1 }
  end
end
