require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Harry') }
  let(:post) { Post.create(title: 'Sample title') }
  subject do
    Like.new(author: user, post:)
  end
  describe 'Validations' do
    it 'expect like to be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'Check methods' do
    it 'validates update like counter method' do
      subject.update_likes_counter
      expect(post.likes_counter).to eq(1)
    end
  end
end
