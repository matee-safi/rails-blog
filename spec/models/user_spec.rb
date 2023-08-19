require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Harry',
      photo: 'sample.jpg',
      bio: 'Hi I am harry',
      posts_counter: 0
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid without a photo' do
      subject.photo = ''
      expect(subject).to be_valid
    end

    it 'is not valid without name attribute' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid when posts counter is not an integer' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid when posts counter is less than zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Method check' do
    before do
      5.times do |index|
        Post.create(
          author: subject,
          title: "Post #{index}",
          text: "this is my #{index}th post",
          comments_counter: 0,
          likes_counter: 0,
          created_at: Time.now - index.days
        )
      end
    end

    it 'should retrieve three recent posts' do
      recent_posts = subject.recent_posts
      expect(recent_posts.length).to eq(3)
    end
  end
end
