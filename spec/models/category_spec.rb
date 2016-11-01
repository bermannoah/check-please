require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a name" do
        category = Category.new

        expect(category).to be_invalid
      end

      it "cannot be created without a unique name" do
        Category.create(name: "test")
        category = Category.new(name: "test")

        expect(category).to be_invalid
      end
    end

    context "valid attribtues" do
      it "is valid with all attributes" do
        category = Category.new(name: "test")

        expect(category).to be_valid
      end
    end
  end

  # describe "relationships" do
  #   it "belongs to a server" do
  #     category = Category.new(name: "test")
  #
  #     expect(category).to respond_to(:server)
  #   end
  # end
end
