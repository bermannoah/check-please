require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a total" do
        server = create(:server)
        order = Order.new(server_id: server.id, paid?: true)

        expect(order).to be_invalid
      end

      it "cannot be created without being paid" do
        server = create(:server)
        order = Order.new(server_id: server.id, total: 1000)

        expect(order).to be_invalid
      end
      
      it "cannot be created without a server id" do
        server = create(:server)
        order = Order.new(total: 1000, paid?: true)

        expect(order).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        order = create(:order_with_server)

        expect(order).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a server" do
      order = create(:order_with_server)

      expect(order).to respond_to(:server)
    end

    it "has many order_items" do
      order = create(:order_with_server)

      expect(order).to respond_to(:order_items)
    end
    
    it "has many items" do
      order = create(:order_with_server)

      expect(order).to respond_to(:items)
    end
  end
end
