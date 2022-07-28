class Comment < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :post

  # Validations
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true, length: { in: 1..140 }

  after_create_commit do
    broadcast_append_to("#{self.post_id}", target: "#{self.post_id}", partial: "posts/comments/comment", locals: { comment: self })
    broadcast_update_to("#{self.post_id}", target: "#{self.post_id}_likes_comments", partial: "posts/likesandcomments", locals: { post: self.post })
  end
  
  after_destroy_commit do
    broadcast_remove_to("#{self.post_id}", target: "comment_#{self.id}")
    broadcast_update_to("#{self.post_id}", target: "#{self.post_id}_likes_comments", partial: "posts/likesandcomments", locals: { post: self.post })
  end
end
