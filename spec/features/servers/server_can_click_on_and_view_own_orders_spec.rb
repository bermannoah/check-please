require 'rails_helper'

describe "server can see items within orders" do
  scenario "server can see and click on order" do
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
    server_order = server.orders.first
    visit orders_path
    
    expect(page).to have_content(server_order.id)
    
    click_on "Order #{server_order.id}"
    
    expect(page).to have_content(item.name)
  end

end