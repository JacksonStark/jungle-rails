require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: 'Jesus') }
    let(:product) { category.products.new(name: 'Bible', price: 444.44, quantity: 3) }

    it 'is valid when all arguments provided' do
      puts product.inspect
      expect(product).to be_valid
    end

    it 'is invalid when name argument not provided' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'is invalid when price argument not provided' do
      product.price_cents = nil
      expect(product).to_not be_valid
    end

    it 'is invalid when quantity argument not provided' do
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it 'is invalid when category_id argument not provided' do
      product.category = nil
      expect(product).to_not be_valid
    end
  end
end
