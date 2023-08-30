require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Harry') }
  let(:post) { Post.create(author: user, title: 'Sample title') }

  subject do
    Comment.new(
      post:,
      author: user,
      text: 'Hi'
    )
  end

  describe 'Validations' do
    it 'Should be valid with text' do
      expect(subject).to be_valid
    end

    it 'Should not be valid without text' do
      subject.text = ''
      expect(subject).to_not be_valid
    end
  end

  describe 'Methods' do
    it 'Validates update comments counter method' do
      user
      post
      subject.save
      expect(post.comments_counter).to eq(1)
    end
  end
end
