require 'rails_helper'

RSpec.describe "server creates and views orders" do
  it "makes an order" do
    server = create(:server)
    item   = create(:item_with_category)
    category = item.category

    expect(Server.all.count).to eq(1)
    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    click_on "#{category.name}"

    click_on "Add to Ticket"

    page.find("#ticket").click

    click_button "Submit Ticket"

    expect(server.orders.count).to eq(1)
    expect(current_path).to eq(dashboard_path)
  end
end
