FactoryBot.define do
  factory :notification do
    body { "MyText" }
    user_id { 1 }
    seen { false }
  end
end
