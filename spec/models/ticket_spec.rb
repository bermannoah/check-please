require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "#items" do
    it "it displays a hash of items" do
      item_1, item_2  = create_list(:item_with_category, 2)

      ticket = Ticket.new
      ticket.add_item(item_1.id)
      ticket.add_item(item_2.id)

      expect(ticket.items).to eq({item_1 => 1, item_2 => 1})
    end
  end
  describe "#delete" do
    it "deletes an item from contents" do
      item_1 = create(:item_with_category)

      ticket = Ticket.new({})
      ticket.add_item(item_1.id)
      ticket.delete(item_1.id)

      expect(ticket.items).to be_empty
    end
    describe "#update" do
      it "changes an item from quantity" do
        item_1 = create(:item_with_category)

        ticket = Ticket.new({})
        ticket.add_item(item_1.id)
        ticket.update_quantity(item_1.id, 2)

        expect(ticket.items).to eq({item_1 => 2})
      end
      it "removes item if quantity is zero" do
        item_1 = create(:item_with_category)

        ticket = Ticket.new({})
        ticket.add_item(item_1.id)
        ticket.update_quantity(item_1.id, 0)

        expect(ticket.items).to be_empty
      end
    end
    describe "#total" do
      it "has can total of all items" do
        item_1,item_2 = create_list(:item_with_category,2)
        ticket = Ticket.new({})
        total = (item_1.price*2)+item_2.price

        ticket.add_item(item_1.id)
        ticket.add_item(item_1.id)
        ticket.add_item(item_2.id)


        expect(ticket.total).to eq(total)
      end
    end
    describe "#create_order_items" do
      it "creates order_items for each item" do
        server = Server.create(name:"test", username:"test", password:"test", password_confirmation:"test")
        ticket = Ticket.new({})
        item_1 = create(:item_with_category)
        ticket.add_item(item_1.id)
        order = Order.create(server:server, total:ticket.total, paid?: false)

        ticket.create_order_items(order.id)

        expect(OrderItem.all.count).to eq(1)
        expect(OrderItem.first.item_id).to eq(item_1.id)

      end
    end
  end
end


#   describe 'validations' do
#     context "invalid attributes" do
#       it "cannot be created without a location" do
#         ticket = ticket.new
#
#         expect(ticket).to be_invalid
#       end
#
#       it "cannot be created without a unique location" do
#         ticket.create(location: "1")
#         ticket = ticket.new(location: "1")
#
#         expect(ticket).to be_invalid
#       end
#     end
#
#     context "valid attribtues" do
#       it "is valid with all attributes" do
#         ticket = ticket.new(location: "1")
#
#         expect(ticket).to be_valid
#       end
#     end
#   end
#
#   describe "relationships" do
#     it "belongs to a server" do
#       ticket = ticket.new(location: "1")
#
#       expect(ticket).to respond_to(:server)
#     end
#
#     it "has many items" do
#       ticket = ticket.new(location: "1")
#
#       expect(ticket).to respond_to(:ticket_items)
#     end
#   end
# end
