class Friendship < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  # Validations
  validates :user_id, presence: true
  validates :friend_id, presence: true
  validate :user_and_friend_are_not_the_same
  validates_uniqueness_of :user_id, scope: [:user_id]

  def user_and_friend_are_not_the_same
    if friend == user
      errors.add(:friendship, "can't be friends with same account")
    end
  end
end
