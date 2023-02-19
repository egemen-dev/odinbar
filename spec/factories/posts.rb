# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { 'MyText' }
    user_id { 1 }
  end
end
