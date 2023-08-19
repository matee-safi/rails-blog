require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(id: 1, name: 'Harry') }
  let(:post) { Post.create(id: 1, title: 'Sample title', comments_counter: 0) }

  describe 'Methods' do
    subject do
        Comment.create(
            post_id: post.id,
            author_id: user.id,
            text: 'Hi'
        )
    end
    
    it 'validates update_comments_counter method' do
      subject.update_comments_counter
      expect(post.comments_counter).to eq(1)
    end
  end
end
