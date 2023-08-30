require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before do
      get users_path
    end
    it 'if reponse status is correct' do
      expect(response.status).to eq(200)
    end
    it 'if correct template was rendered' do
      expect(response).to render_template(:index)
    end
    it 'if the response body includes correct placeholder text' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET #show' do
    before do
      get user_path(1)
    end
    it 'if response status was correct' do
      expect(response.status).to eq(200)
    end
    it 'if a correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'if the response body includes correct placeholder text' do
      expect(response.body).to include('Bio')
    end
  end
end
