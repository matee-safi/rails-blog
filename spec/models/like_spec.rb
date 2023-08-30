require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Harry', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Sample title', likes_counter: 1) }

  subject do
    Like.new(author: user, post: post)
  end
  describe 'Validations' do
    it 'expect like to be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'Check methods' do
    it 'validates update like counter method' do
      subject.save
      expect(post.likes_counter).to eq(1)
    end
  end
end
