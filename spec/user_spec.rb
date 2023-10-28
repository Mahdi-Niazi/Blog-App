require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Iqbal Elham', photo: 'https://pexel.com/300', bio: 'Software Engineer', post_counter: 0)
  end

  describe 'initialize' do
    it 'should be valid' do
      expect(@user.valid?).to be(true)
    end

    it 'should be a user' do
      expect(@user).to be_a(User)
    end

    it 'should have a name' do
      expect(@user.name).to eq('Iqbal Elham')
    end

    it 'should have a photo' do
      expect(@user.photo).to eq('https://pexel.com/300')
    end

    it 'should have a bio' do
      expect(@user.bio).to eq('Software Engineer')
    end

    it 'should have a posts counter' do
      expect(@user.post_counter).to eq(0)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      @user.name = nil
      expect(@user.valid?).to be(false)
      expect(@user.errors.include?(:name)).to be(true)
    end

    it 'should validate numericality of posts counter' do
      @user.post_counter = 'f'
      expect(@user.valid?).to be(false)
      expect(@user.errors.include?(:post_counter)).to be(true)

      @user.post_counter = -1
      expect(@user.valid?).to be(false)
      expect(@user.errors.include?(:post_counter)).to be(true)
    end
  end

  describe 'methods' do
    it 'should return 3 last posts' do
      4.times do |i|
        Post.create(author_id: @user.id, title: "Post ##{i}", text: "This is post ##{i}", comments_counter: 0,
                    likes_counter: 0)
      end
      puts Post.first
      expect(@user.recent_posts.count).to eq(3)
    end
  end
end
