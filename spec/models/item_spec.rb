require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a name" do
        item = Item.new(price: 100)

        expect(item).to be_invalid
      end

      it "cannot be created without a price" do
        item = Item.new(name: "test")

        expect(item).to be_invalid
      end

      it "cannot be created without a unique name" do
       Item.create(name: "test", price: 100)
        item = Item.new(name: "test", price: 150)

        expect(item).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        item = Item.new(name: "test", price: 100)

        expect(item).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a category" do
      item = Item.new(name: "test", price: 100)

      expect(item).to respond_to(:category)
    end

    it "has many tables" do
      item = Item.new(name: "test", price: 100)

      expect(item).to respond_to(:table_items)
    end
  end
end
