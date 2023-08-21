class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  validates :author, :post, presence: true

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
