# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    user_id { 1 }
    friend_id { 2 }
    status { false }
  end
end
