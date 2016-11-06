require 'rails_helper'

feature "order status" do
  it "it shows the time and date if it was cancelled" do
    server = create(:server)
    item_1, item_2 = create_list(:item_with_category, 2)
    category = item_1.category
    order = Order.create(server: server, total:(item_1.price + item_2.price))
    order.update_attributes(status:"cancelled")
    order_item_1 = OrderItem.create(item: item_1, order: order)
    order_item_2 = OrderItem.create(item: item_2, order: order)

    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    visit get_order_path(order)

    expect(order.status).to eq("cancelled")
    expect(order.completed_or_cancelled?).to eq(true)
    expect(page).to have_content("Order was #{order.status} at #{order.updated_at}")

  end
  it "it shows the time and date if it was completed" do
      server = create(:server)
      item_1, item_2 = create_list(:item_with_category, 2)
      category = item_1.category
      order = Order.create(server: server, total:(item_1.price + item_2.price))
      order.update_attributes(status:"completed")
      order_item_1 = OrderItem.create(item: item_1, order: order)
      order_item_2 = OrderItem.create(item: item_2, order: order)

      visit login_path

      fill_in "username", with: server.username
      fill_in "password", with: server.password
      click_button "Login"

      visit get_order_path(order)

      expect(order.status).to eq("completed")
      expect(order.completed_or_cancelled?).to eq(true)
      expect(page).to have_content("Order was #{order.status} at #{order.updated_at}")
    end
end
