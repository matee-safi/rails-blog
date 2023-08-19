require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Harry', posts_counter: 0) }
  subject do
    Post.new(
      author: user,
      title: 'H1',
      text: 'Hello everyone',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'Validations' do
    it 'Should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Validates presence of title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should not be valid if title exceeds 250' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'Should not be valid if comments counter is not an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'Should not be valid if comments counter is less than zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should not be valid if likes counter is not an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'Should not be valid if likes counter is less than zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Methods' do
    before do
      7.times do |_index|
        Comment.create(
          author: user,
          post: subject,
          text: 'Nice!'
        )
      end
    end
    it 'Should return 5 recent comments' do
      expect(subject.recent_comments.length).to eq(5)
    end

    it 'Should update post counter' do
      5.times do |_index|
        @index = Post.create(
          author: user,
          title: 'H1',
          text: 'Hello everyone',
          comments_counter: 0,
          likes_counter: 0
        )
      end
      subject.update_posts_counter
      expect(user.posts_counter).to eq(6)
    end
  end
end
