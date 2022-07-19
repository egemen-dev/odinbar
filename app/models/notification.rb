class Notification < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :user_id, presence: true
  validates :body, presence: true, length: { in: 10..120 }
end
