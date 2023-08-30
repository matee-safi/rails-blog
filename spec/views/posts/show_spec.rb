require 'rails_helper'

RSpec.describe "Post's show page", type: :feature do
    before do
        @user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0)
        @post = Post.create(author: @user, title: 'Test post', text: 'this is a test post made for testing our views with capybara')
        Comment.create(author: @user, post: @post, text: 'Nice!')
        Like.create(author: @user, post: @post)
        visit user_post_path(@user, @post)
    end

    it "Displays the post's title" do
        expect(page).to have_content('Test post')
    end

    it "Displays the post's author" do
        expect(page).to have_content('Harry')
    end

    it "Displays how many comments it has" do
        expect(page).to have_content('Comments: 1')
    end

    it "Displays how many likes it has" do
        expect(page).to have_content('Likes: 1')
    end

    it "Displays the post body" do
        expect(page).to have_content('this is a test post made for testing our views with capybara')
    end

    it "Displays the username of each commentor" do
        expect(page).to have_content('Harry')
    end

    it "Displays the comment each commentor left" do
        expect(page).to have_content('Nice!')
    end
end