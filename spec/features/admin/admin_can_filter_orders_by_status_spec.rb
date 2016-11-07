require 'rails_herlper'

Rspec.feature "admin filters orders by status" do
  before :each do
    @admin = create(:admin)
    @server = create(:server)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    @order_1 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"ordered")
    @order_2 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"paid")
    @order_two_point_five = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"paid")
    @order_3 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"cancelled")
    @order_4 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"completed")
    @order_items_1 = OrderItem.create(item:@item_1, order:@order)
    @order_items_2 = OrderItem.create(item:@item_2, order:@order)

    page.set_rack_session(server_id: @admin.id)

    visit admin_dashboard_path
  end

  it "filters orders by status" do
    within ".order_partial" do
      
    end
  end
end
