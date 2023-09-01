class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  after_initialize :init

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def init
    self.posts_counter ||= 0
    self.photo ||= 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'
  end

  def recent_posts(limit = 3)
    posts.includes(:author, :comments).order(created_at: :desc).limit(limit)
  end
end
