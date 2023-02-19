# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @test_user = User.find_by(username: 'TesterJoe', email: 'testerjoe@gmail.com') || FactoryBot.build(:user, id: 1)
  end

  describe 'Associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      post = FactoryBot.build(:post, user: @test_user)
      expect(post).to be_valid
    end

    it 'is not valid without a user' do
      post = FactoryBot.build(:post, user: nil)
      expect(post).to_not be_valid
    end

    it 'is not valid without a body' do
      post = FactoryBot.build(:post, body: nil)
      expect(post).to_not be_valid
    end
  end
end
