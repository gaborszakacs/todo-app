require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe '#position' do
    let!(:item1) { Item.create(name: 'item1', done: false) }
    let!(:item2) { Item.create(name: 'item2', done: false) }
    let!(:item3) { Item.create(name: 'item2', done: false) }

    it 'is set to the last one' do
      expect(item3.position).to eq 3
    end
  end
end
