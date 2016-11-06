require 'rails_helper'

feature "order status" do
  before :each do
    @server = create(:server)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    @category = @item_1.category
    @order = Order.create(server: @server, total:(@item_1.price + @item_2.price))
    @order_item_1 = OrderItem.create(item: @item_1, order: @order)
    @order_item_2 = OrderItem.create(item: @item_2, order: @order)

    visit login_path

    fill_in "username", with: @server.username
    fill_in "password", with: @server.password
    click_button "Login"
    click_on "#{@category.name}"
    click_on "Add to Ticket"
    page.find("#ticket").click
    click_button "Submit Ticket"
    @server_order = @server.orders.first
    visit orders_path
    click_on "Order #{@server_order.id}"

  end

  it "user can see order status on the order show page" do
    expect(page).to have_content(@order.status.capitalize)
  end

  it "user can see order total on the order show page" do
    expect(page).to have_content(@order.total)
  end

  it "it shows the time and date if it was cancelled" do
    

  end
end
