class Comment < ApplicationRecord
    belongs_to :post
belongs_to :author, class_name: 'User', foreign_key: 'author_id'

def update_comments_counter
    post.increment!(:comments_counter)
  end


private
  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
