require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  describe 'items index' do
    before(:each) do
      get category_items_path(1)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(302)
    end

    it 'returns a list of items' do
      expect(response.body).to include('You are being')
    end
  end
end