require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before do
    @first_user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @second_user = User.create(name: 'Ron', photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    Post.create(author: @first_user, title: 'Test post', text: 'This is my first post')
    Post.create(author: @second_user, title: 'Test post', text: 'This is my second post')
    visit users_path
  end

  it 'Displays the username of all other users' do
    expect(page).to have_content('Harry')
    expect(page).to have_content('Ron')
  end

  it 'Displays the profile picture for each user.' do
    expect(page).to have_css('img')
  end

  it 'Displays the number of posts each user has written.' do
    expect(page).to have_content(@first_user.posts_counter)
    expect(page).to have_content(@second_user.posts_counter)
  end

  it 'redirects to user show page when clicking on a user' do
    click_link 'Harry'
    expect(page).to have_current_path(user_path(@first_user))
  end
end
