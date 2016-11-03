require 'rails_helper'

RSpec.scenario "server creates and views orders" do
  it "makes an order" do
``    server = create(:server)
    item   = create(:item_with_category)
    category = item.category

    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password

    click_on "Login"

    click_on "#{category.name}"

    click_on "Add to Ticket"

    click_on "ticket"

    click_on "submit ticket"

    expect(current_path).to eq(dashboard_path)
    expect(server.orders.count).to eq(1)
  end
end
