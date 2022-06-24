class User < ApplicationRecord
  # Relations
  has_many :friendships
  has_many :friends, through: :friendships

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
