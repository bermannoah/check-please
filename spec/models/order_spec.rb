require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#items" do
    it "it displays a hash of items" do
      item_1, item_2  = create_list(:item_with_category, 2)

      order = Order.new({})
      order.add_item(item_1.id)
      order.add_item(item_2.id)

      expect(order.items).to eq({item_1 => 1, item_2 => 1})
    end
  end
  describe "#delete" do
    it "deletes an item from contents" do
      item_1 = create(:item_with_category)

      order = Order.new({})
      order.add_item(item_1.id)
      order.delete(item_1.id)

      expect(order.items).to be_empty
    end
    describe "#update" do
      it "changes an item from quantity" do
        item_1 = create(:item_with_category)

        order = Order.new({})
        order.add_item(item_1.id)
        order.update_quantity(item_1.id, 2)

        expect(order.items).to eq({item_1 => 2})
      end
    end
  end
end


#   describe 'validations' do
#     context "invalid attributes" do
#       it "cannot be created without a location" do
#         order = Order.new
#
#         expect(order).to be_invalid
#       end
#
#       it "cannot be created without a unique location" do
#         Order.create(location: "1")
#         order = Order.new(location: "1")
#
#         expect(order).to be_invalid
#       end
#     end
#
#     context "valid attribtues" do
#       it "is valid with all attributes" do
#         order = Order.new(location: "1")
#
#         expect(order).to be_valid
#       end
#     end
#   end
#
#   describe "relationships" do
#     it "belongs to a server" do
#       order = Order.new(location: "1")
#
#       expect(order).to respond_to(:server)
#     end
#
#     it "has many items" do
#       order = Order.new(location: "1")
#
#       expect(order).to respond_to(:order_items)
#     end
#   end
# end
