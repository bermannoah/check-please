require 'rails_helper'

RSpec.describe "server creates and views orders" do
  it "makes an order" do
    server = create(:server)
    item   = create(:item_with_category)
    category = item.category
    expect(Item.all.count).to eq(1)
    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    click_on "#{category.name}"

    click_on "Add to Ticket"

    page.find("#ticket").click

    click_button "Submit Ticket"

    expect(server.orders.count).to eq(1)
    expect(current_path).to eq(orders_path)
  end
  
  scenario "server can see orders" do
    server = create(:server)
    item = create(:item_with_category)
    category = item.category
    
    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"
    
    click_on "#{category.name}"

    click_on "Add to Ticket"

    page.find("#ticket").click

    click_button "Submit Ticket"

    visit orders_path
    
    expect(page).to have_content("Order #{Order.all.last.id}")
  end
  
  scenario "server can only see own orders" do
    server_1, server_2 = create_list(:server, 2)
    item_1, item_2 = create_list(:item_with_category, 2)
    category_1 = item_1.category
    category_2 = item_2.category
    
    visit login_path

    fill_in "username", with: server_1.username
    fill_in "password", with: server_1.password
    click_button "Login"
    
    click_on "#{category_1.name}"

    click_on "Add to Ticket"

    page.find("#ticket").click

    click_button "Submit Ticket"
    server_1_order = server_1.orders.first
    click_on "Logout"
    
    visit login_path

    fill_in "username", with: server_2.username
    fill_in "password", with: server_2.password
    click_button "Login"
    
    click_on "#{category_2.name}"

    click_on "Add to Ticket"

    page.find("#ticket").click

    click_button "Submit Ticket"
    server_2_order = server_2.orders.first
    visit orders_path

    expect(page).to have_content(server_2_order.id)
    expect(page).to_not have_content(server_1_order.id)
  end
end
