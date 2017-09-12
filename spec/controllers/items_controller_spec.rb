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

  describe 'DELETE #destroy' do
    let!(:item1) { Item.create(name: 'item1', done: false, position: 1) }
    let!(:item2) { Item.create(name: 'item2', done: false, position: 2) }

    before do
      delete :destroy, params: { id: item2.id }
    end

    it 'deletes one item' do
      expect(Item.count).to eq(1)
    end

    it 'deletes the item' do
      expect(Item.first).to eq(item1)
    end
  end

  describe 'PUT #update' do
    let!(:item) { Item.create(name: 'item', done: false, position: 1) }

    before do
      put :update, params: { id: item.id, item: { name: 'updated_item' } }
    end

    it 'modifies the item' do
      expect(item.reload.name).to eq('updated_item')
    end
  end
end
