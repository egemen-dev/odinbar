require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "Associations with User" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Associations with Friend" do
    it { should belong_to(:friend).class_name('User') }
  end

  it 'is valid with valid attributes' do
    friend = FactoryBot.build(:user, email: 'abctest@gmail.com', username: 'test', id: 2)
    example_friendship = build(:friendship, friend: friend)
    expect(example_friendship).to be_valid
  end

  it 'is not valid without user_id' do
    friendship1 = build(:friendship, user_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'is not valid without friend_id' do
    friendship1 = build(:friendship, friend_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'is not valid without user_id and friend_id' do
    friendship1 = build(:friendship, friend_id: nil, user_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'fails if user and friend are the same' do
    user_test = FactoryBot.build(:user, email: 'abctest@gmail.com', username: 'test', id: 2)
    friendship3 = build(:friendship, friend: user_test, user: user_test)
    expect(friendship3).to_not be_valid
  end
end
