class Post < ApplicationRecord
  # Relations
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
  has_rich_text :body

  # Validations
  has_many :post_likings, dependent: :destroy
  has_many :user_likes, through: :post_likings, source: :user
  has_many :comments, dependent: :destroy
end
