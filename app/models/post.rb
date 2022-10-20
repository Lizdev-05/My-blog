class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

 validate :title, presence: true, length: { maximum: 250 }
 validate :comments_counter , numericality: { only_integer: true, greater_than_or_equal_to: 0 }
 validate :likes_counter , numericality: { only_integer: true, greater_than_or_equal_to: 0 }   

  def return_recent_comments
    comment.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
