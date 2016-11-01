require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a location" do
        table = Table.new

        expect(table).to be_invalid
      end

      it "cannot be created without a unique location" do
        Table.create(location: "1")
        table = Table.new(location: "1")

        expect(table).to be_invalid
      end
    end

    context "valid attribtues" do
      it "is valid with all attributes" do
        table = Table.new(location: "1")

        expect(table).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a server" do
      table = Table.new(location: "1")

      expect(table).to respond_to(:server)
    end
  end
end
