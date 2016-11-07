require 'rails_helper'

RSpec.feature "admin views the individual order" do
  before :each do
    @admin = create(:admin)
    @server = create(:server)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    @order = Order.create(server:@server, total:(@item_1.price + @item_2.price))
    @order_items_1 = OrderItem.create(item:@item_1, order:@order)
    @order_items_2 = OrderItem.create(item:@item_2, order:@order)

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

  it "Shows each item on the order with price, quantity, and line item subtotal" do
    click_link "#{@order.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_2.price)
    expect(page).to have_content(1)
    expect(page).to have_content(1)
  end
end
