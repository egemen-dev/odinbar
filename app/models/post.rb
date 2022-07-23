class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
  has_rich_text :body

  has_many :post_likings, dependent: :destroy
  has_many :user_likes, through: :post_likings, source: :user
end
