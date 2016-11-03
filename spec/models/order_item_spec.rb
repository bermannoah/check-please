require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "relationships" do
    it "belongs to a table" do
      ticket_item = OrderItem.new(order_id: 1, item_id: 1)

      expect(ticket_item).to respond_to(:order)
    end

    it "belongs to an item" do
      ticket_item = OrderItem.new(order_id: 1, item_id: 1)

      expect(ticket_item).to respond_to(:item)
    end
  end
end
