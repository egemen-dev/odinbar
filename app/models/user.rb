class User < ApplicationRecord
  # Relations
  has_many :friendships
  has_many :received_requests, -> { where status: nil }, class_name: 'Friendship'
  has_many :accepted_requests, -> { where status: true }, class_name: 'Friendship'
  has_many :friends, through: :accepted_friends

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
