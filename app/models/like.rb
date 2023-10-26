class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_like_counter

  def update_like_counter
    Post.find(post_id).update(likes_counter: Like.where(post_id).count)
  end
end
