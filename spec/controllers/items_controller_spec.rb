require 'rails_helper'
RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'adds one item' do
      items_before = Item.count
      post :create, params: { item: { name: 'item' } }
      expect(Item.count).to eq(items_before + 1)
    end
  end
end
