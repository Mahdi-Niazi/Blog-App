require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'User Test', photo: 'photo.com', bio: 'Test Comment', post_counter: 0) }
  let(:post) do
    Post.create(author_id: user.id, title: 'Test', text: 'Text Test', comments_counter: 0, likes_counter: 0)
  end

  describe 'initialize' do
    before(:each) do
      @comment = Comment.new(post_id: post.id, author_id: user.id, text: 'This is a comment')
    end

    it 'should be valid' do
      expect(@comment.valid?).to be(true)
    end

    it 'should be a comment' do
      expect(@comment).to be_a(Comment)
    end

    it 'should have a post id' do
      expect(@comment.post_id).to eq(post.id)
    end

    it 'should have an author id' do
      expect(@comment.author_id).to eq(user.id)
    end

    it 'should have a text' do
      expect(@comment.text).to eq('This is a comment')
    end
  end

  it 'increments the comments counter of the associated post after creation' do
    Comment.create(post_id: post.id, author_id: user.id, text: 'This is a comment')
    expect(post.reload.comments_counter).to eq(1)
  end
end
