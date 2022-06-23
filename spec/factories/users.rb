FactoryBot.define do
  factory :user do
    username { 'TesterJoe' }
    email { 'testerjoe@gmail.com' }
    password { 'joe123456' }
  end
end
