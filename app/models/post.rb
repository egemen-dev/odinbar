class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { in: 1..1000 }
end
