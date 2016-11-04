require "rails_helper"

RSpec.describe "Orders status" do
  it "defaults with a 'ordered status'" do
    server = create(:server)
    order = Order.new(server: server, total: 5.00)

    expect(order.status).to eq("ordered")
  end

  it "order status can be updated" do
    server = create(:server)
    order = Order.new(server: server, total: 5.00, status: "completed")

    expect(order.status).to eq("completed")
  end

  it "order status is only valid if from list" do
    server = create(:server)

    expect{Order.new(server: server, total: 5.00, status: "asdf")}.to raise_error(ArgumentError)
  end
end

feature "order status" do
  it "user can see order status on the order show page" do
    server = create(:server)
    item_1, item_2 = create_list(:item, 2)
    order = Order.new(server: server, total:(item_1.price+item_2.price))
    order_item_1 = OrderItem.new(item: item_1, order: order)
    order_item_2 = OrderItem.new(item: item_2, order: order)

    
  end
end
