class User < ApplicationRecord
  # Relations
  has_many :friendships
  has_many :sent_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :received_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'friend_id'

  # Friend request from me and accepted by receiver user
  has_many :acceptance_by_them, -> { where status: true }, class_name: 'Friendship', foreign_key: 'user_id'

  # Friend request from another user and accepted by me
  has_many :acceptance_by_me, -> { where status: true }, class_name: 'Friendship', foreign_key: 'friend_id'

  # Friends that I sent request to
  has_many :type_1_friends, through: :acceptance_by_them, source: :friend

  # Users that sent me the request
  has_many :type_2_friends, through: :acceptance_by_me, source: :user

  def active_friends
    type_1_friends | type_2_friends
  end

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
