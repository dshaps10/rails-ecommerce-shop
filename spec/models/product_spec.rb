require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:test) {Product.create(name: "test", description: "test", quantity: 2, list_price: 2.456)}

  describe "Product Object" do
    it "has a valid name" do
      expect(test.name).to eq "test"
    end

    it "has a valid description" do
      expect(test.description).to eq "test"
    end

    it "has a valid quantity" do
      expect(test.quantity).to eq 2
    end

    it "has a valid price" do
      expect(test.list_price).to eq 2.46
    end
  end
end
