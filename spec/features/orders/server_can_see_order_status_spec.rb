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
