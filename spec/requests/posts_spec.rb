require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index each user posts' do
    before do
      get '/users/1/posts'
    end
    it 'checks if status was correct' do
      expect(response.status).to eq(200)
    end
    it 'checks if correct template was rendered' do
      expect(response).to render_template(:index)
    end
    it 'checks if the response body includes correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    before do
      get user_post_path(user_id: 1, id: 1)
    end
    it 'if response status was correct' do
      expect(response.status).to eq(200)
    end
    it 'if a correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'if the response body includes correct placeholder text' do
      expect(response.body).to include('Post')
    end
  end
end
