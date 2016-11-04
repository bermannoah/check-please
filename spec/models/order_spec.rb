require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it "cannot be created without a total" do
        server = create(:server)
        order = Order.new(server_id: server.id, paid?: true)

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
  
  describe "methods" do
    it "is able to prep lines for show" do
      order = create(:order_with_server)
      item_1, item_2 = create_list(:item, 2)
      order_item_1 = OrderItem.create(order: order, item: item_1)
      order_item_2 = OrderItem.create(order: order, item: item_1)
      order_item_3 = OrderItem.create(order: order, item: item_2)

      expect(order.prep_for_show).to eq([[item_1, 2, (item_1.price * 2)], [item_2, 1, item_2.price]])
      
    end
  end
end
