# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyText' }
    post_id { 1 }
    user_id { 1 }
  end
end
