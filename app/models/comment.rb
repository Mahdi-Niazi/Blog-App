class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter

  def update_coumment_counter
    Post.find(post_id).update(comments_counter: Comment.where(post_id).count)
  end
end
