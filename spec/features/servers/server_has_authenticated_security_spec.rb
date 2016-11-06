require 'rails_helper'

describe "registered server has authenticated security" do
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

  it "server cannot view admin screen or use admin functionality" do
    server = create(:server)
    page.set_rack_session(server_id: server.id)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  # it "server cannot make self admin" do
  #   pending
  # end
end

describe "unregistered server does not have authenticated security" do
  it "unregistered server cannot view another server's order" do
    server = create(:server)
    item= create(:item_with_category)
    category = item.category
    order = Order.create(server: server, total:(item.price))
    order_item = OrderItem.create(item: item, order: order)
    server_order = server.orders.first

    visit orders_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  it "unregisterd server sees login or checkout form when trying to submit ticket" do
    server = create(:server)
    item= create(:item_with_category)
    category = item.category

    visit menu_path
    click_link "#{category.name}"
    page.find("#ticket").click

    expect(page).to have_button("Login")
    expect(page).to have_button("Create Account")
    expect(page).not_to have_button("Submit Ticket")
  end

  it "unregistered server cannot view admin screen or use admin functionality" do
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
