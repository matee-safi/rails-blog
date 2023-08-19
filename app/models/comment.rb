class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  # create a function to update the comments counter
  def update_comments_counter
    post.update(comments_counter: post_id.count)
  end
end
