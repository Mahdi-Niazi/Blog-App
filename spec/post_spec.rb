require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User', photo: 'photo.com', bio: 'Test User') }
  let(:post) { Post.create(title: 'Test post', author_id: user.id, comments_counter: 0, likes_counter: 0) }

  it 'validates presence of title' do
    post.title = ''
    expect(post).to_not be_valid
  end

  it 'validates that title is not too long' do
    post.title = 'a' * 2
    expect(post).to_not be_valid
  end

  it 'validates that comments_counter is greater than or equal to 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'validates that likes_counter is greater than or equal to 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'returns the five most recent comments for the post' do
    expect(post.recent_comments).to eq(post.comments.order(created_at: :desc).limit(5))
  end
end
