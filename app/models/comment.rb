class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  validates :text, presence: true

  after_create :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
