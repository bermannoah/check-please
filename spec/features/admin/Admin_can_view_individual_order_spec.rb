require 'rails_helper'

RSpec.feature "admin views the individual order" do
  before :each do
    @admin = create(:admin)
    @server = create(:server)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    @order = Order.create(server:@server, total:(@item_1.price + @item_2.price))

    page.set_rack_session(server_id: @admin.id)

    visit admin_dashboard_path
  end
  it "they can see order date and time" do

    click_link "#{@order.id}"

    expect(current_path).to eq(get_order_path(@order.id))
    expect(page).to have_content(@order.created_at)
  end

  it "they can see the servers email address" do
    click_link "#{@order.id}"

    expect(page).to have_content(@server.name)
    expect(page).to have_content(@server.username)
  end
end
