require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "Associations with User" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Associations with Friend" do
    it { should belong_to(:friend).class_name('User').without_validating_presence }
  end

  it 'is valid with valid attributes' do
    friend = FactoryBot.build(:user, email: 'friend@gmail.com', username: 'test', id: 1)
    user = FactoryBot.build(:user, email: 'user@gmail.com', username: 'test', id: 2)
    example_friendship = build(:friendship, friend: friend, user: user)
    expect(example_friendship).to be_valid
  end

  it 'is not valid without user_id' do
    friendship1 = FactoryBot.build(:friendship, user_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'is not valid without friend_id' do
    friendship1 = FactoryBot.build(:friendship, friend_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'is not valid without user_id and friend_id' do
    friendship1 = FactoryBot.build(:friendship, friend_id: nil, user_id: nil)
    expect(friendship1).to_not be_valid
  end

  it 'fails if user and friend are the same' do
    user_test = FactoryBot.build(:user, email: 'abctest@gmail.com', username: 'test', id: 2)
    friendship3 = build(:friendship, friend: user_test, user: user_test)
    expect(friendship3).to_not be_valid
    expect(friendship3.errors[:friendship]).to include "can't be friends with same account"
  end
  
  it 'fails if user and friend already have a existed friendship' do
    user1 = build(:user, id:1)
    user2 = build(:user, email: 'abctest@gmail.com', username: 'test', id: 2)

    # Saving a friendship to database for second_frienship to fail and raise error.
    create(:friendship, friend: user1, user: user2)

    second_friendship = build(:friendship, friend: user2, user: user1)
    expect(second_friendship).to_not be_valid
    expect {second_friendship.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Friendship user and friend already have a mutual friendship")
  end

  describe "Destruction of user" do
    it 'all friendships of the user gets destroyed as well' do

      # user2 has friendships where he's a user (seneder) and a friend (receiver)
      user1 = FactoryBot.create(:user, email: 'user1@gmail.com', username: 'user01', id: 1)
      user2 = FactoryBot.create(:user, email: 'user2@gmail.com', username: 'user02', id: 2)
      user3 = FactoryBot.create(:user, email: 'user3@gmail.com', username: 'user03', id: 3)
  
      create(:friendship, user: user2, friend: user1, status: true)
      create(:friendship, user: user3, friend: user2, status: true)

      user2.destroy
      expect(Friendship.all).to be_empty
    end
  end
end
