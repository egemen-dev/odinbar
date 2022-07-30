class User < ApplicationRecord
  # Relations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likings, dependent: :destroy
  has_many :liked_posts, through: :post_likings, source: :post
  has_many :friendships, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :sent_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'user_id', dependent: :destroy
  has_many :received_requests, -> { where status: nil }, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  # Friend request from me and accepted by receiver user
  has_many :acceptance_by_them, -> { where status: true }, class_name: 'Friendship', foreign_key: 'user_id', dependent: :destroy

  # Friend request from another user and accepted by me
  has_many :acceptance_by_me, -> { where status: true }, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  # Friends that I sent request to
  has_many :type_1_friends, through: :acceptance_by_them, source: :friend

  # Users that sent me the request
  has_many :type_2_friends, through: :acceptance_by_me, source: :user

  # Users I sent request to
  has_many :request_sent_users, through: :sent_requests, source: :friend

  # Users I received request from
  has_many :request_received_users, through: :received_requests, source: :user
  
  # User profile picture  
  has_one_attached :avatar

  def active_friends
    type_1_friends | type_2_friends
  end

  # Bubble is a collection of user's firends + the user itself
  def bubble
    (type_1_friends | type_2_friends) << self
  end

  def friendship_with(user)
    Friendship.find_by(user_id: user.id, friend_id: self.id) || Friendship.find_by(user_id: self.id, friend_id: user.id)
  end

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(username: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20],
            avatar_url: data['image']
        )
    end
    user
  end
end
