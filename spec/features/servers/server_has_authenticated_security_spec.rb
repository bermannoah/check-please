require 'rails_helper'

describe "server has authenticated security" do
  it "server cannot view another server's order" do
    server_1, server_2 = create_list(:server, 2)
    item_1, item_2 = create_list(:item_with_category, 2)
    category = item_1.category
    order_1 = Order.create(server: server_1, total:(item_1.price))
    order_2 = Order.create(server: server_2, total:(item_2.price))
    order_item_1 = OrderItem.create(item: item_1, order: order_1)
    order_item_2 = OrderItem.create(item: item_2, order: order_2)
    server_order_1 = server_1.orders.first
    server_order_2 = server_2.orders.first

    page.set_rack_session(server_id: server_1.id)

    visit orders_path
    expect(page).to have_content ("Order #{server_order_1.id}")
    expect(page).not_to have_content ("Order #{server_order_2.id}")


  end
end
