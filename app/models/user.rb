class User < ApplicationRecord
  # Relations
  has_many :friendships
  has_many :sent_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :received_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :accepted_requests, -> { where status: true }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :friends, through: :accepted_requests

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
