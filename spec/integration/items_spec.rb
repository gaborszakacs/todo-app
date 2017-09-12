require 'swagger_helper'

describe 'TODO Items API' do
  path '/items' do
    get 'Retrieves all TODO items' do
      tags 'Items'
      produces 'application/json'

      response '200', 'OK' do
        schema '$ref' => '#/definitions/items'

        let!(:item1) { Item.create(name: 'item1', done: false, position: 1) }
        let!(:item2) { Item.create(name: 'item2', done: false, position: 2) }
        run_test!
      end
    end

    post 'Creates an item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'item created' do
        let!(:item) { { name: 'item1' } }
        run_test!
      end

      response '400', 'invalid request' do
        let!(:item) { {} }
        run_test!
      end
    end
  end

  path '/items/{id}' do
    get 'Retrieves a TODO item' do
      tags 'Items'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'item found' do
        schema '$ref' => '#/definitions/item'

        let!(:id) { Item.create(name: 'item1', done: false, position: 1).id }
        run_test!
      end

      response '404', 'item not found' do
        let!(:id) { 0 }
        run_test!
      end
    end

    delete 'Deletes an item' do
      tags 'Items'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'item deleted' do
        let!(:id) { Item.create(name: 'item1', done: false, position: 1).id }
        run_test!
      end
    end
  end
end
