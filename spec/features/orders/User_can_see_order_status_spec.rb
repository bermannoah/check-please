require "rails_helper"

RSpec.describe "Orders status" do
  it "defaults with a 'ordered status'" do
    server = create(:server)
    order = Order.new(server: server, total: 5.00)

    expect(order.status).to eq("ordered")
  end
end
