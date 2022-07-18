require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.find_by(username: 'TesterJoe', email: 'testerjoe@gmail.com') || FactoryBot.build(:user)
  end

  describe "Associations" do
    it { should have_many(:friendships).without_validating_presence }
    it { should have_many(:posts).class_name('Post') }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@user1).to be_valid
    end

    it 'has a unique username' do
      create(:user, username: 'TesterJoe')
      user2 = build(:user, email: 'abctest@gmail.com')
      expect(user2).to_not be_valid
    end

    it 'has a unique email' do
      create(:user, email: 'testerjoe@gmail.com')
      user2 = build(:user, username: 'Joe', email: 'testerjoe@gmail.com')
      expect(user2).to_not be_valid
    end

    it 'is not valid without a password' do
      user2 = build(:user, password: nil)
      expect(user2).to_not be_valid
    end

    it 'is not valid without a username' do
      user2 = build(:user, username: nil)
      expect(user2).to_not be_valid
    end

    it 'is not valid without an email' do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
    end
  end
end
