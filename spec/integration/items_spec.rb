# spec/integration/blogs_spec.rb
require 'swagger_helper'

describe 'TODO Items API' do
  path '/items' do
    get 'Retrieves all TODO items' do
      tags 'Items'
      produces 'application/json', 'application/xml'

      response '200', 'OK' do
        schema '$ref' => '#/definitions/items'

        let!(:item1) { Item.create(name: 'item1', done: false, position: 1) }
        let!(:item2) { Item.create(name: 'item2', done: false, position: 2) }
        run_test!
      end
    end
  end
end
