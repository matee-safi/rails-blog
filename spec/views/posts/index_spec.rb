require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :feature do
  before do
    @user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Test post',
                        text: 'this is a test post made for testing our views with capybara')
    Comment.create(author: @user, post: @post, text: 'Nice!')
    Like.create(author: @user, post: @post)
    visit user_posts_path(@user)
  end

  it "Displays the user's profile picture" do
    expect(page).to have_css('img')
  end

  it "Displays the user's username" do
    expect(page).to have_content('Harry')
  end

  it 'Displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 1')
  end

  it "Displays the post's title" do
    expect(page).to have_content('Test post')
  end

  it "Displays the post's body" do
    expect(page).to have_content('this is a test post made for testing our views with capybara')
  end

  it 'Displays the first comment on a post' do
    expect(page).to have_content('Nice!')
  end

  it 'Displays the number of comments a post has' do
    expect(page).to have_content('Comments: 1')
  end

  it 'Displays the number of likes a post has' do
    expect(page).to have_content('Likes: 1')
  end

  it "When I click on a post, it redirects me to that post's show page" do
    click_on('Test post')
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
