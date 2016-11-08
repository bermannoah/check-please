require "rails_helper"

RSpec.feature "admin can change the order status of orders from the dashboard" do
  before :each do
    @admin = create(:admin)
    @server = create(:server)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    @order_1 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"ordered")
    @order_2 = Order.create(server:@server, total:(@item_1.price + @item_2.price), status:"paid")
    @order_items_1 = OrderItem.create(item:@item_1, order:@order)
    @order_items_2 = OrderItem.create(item:@item_2, order:@order)

    page.set_rack_session(server_id: @admin.id)

    visit admin_dashboard_path
  end

  it "admin can change order status on orders that are ordered to cancelled" do
    within "#order_#{@order_1.id}" do
      click_on "Cancel"
    end

    within "#order_#{@order_1.id}" do
      expect(page).to have_content("cancelled")
    end
  end

  it "admin can change order status on orders thatt are paid to cancelled" do

    within "#order_#{@order_2.id}" do
      click_on "Cancel"
    end

    within "#order_#{@order_2.id}" do
      expect(page).to have_content("cancelled")
    end
  end

  it "admin can change order status on orders that are ordered to paid" do
    within "#order_#{@order_1.id}" do
      click_on "Mark As Paid"
    end

    within "#order_#{@order_1.id}" do
      expect(page).to have_content("paid")
    end
  end

  it "admin can change order status on orders that are paid to completed" do
    within "#order_#{@order_2.id}" do
      click_on "Mark As Completed"
    end

    within "#order_#{@order_2.id}" do
      expect(page).to have_content("completed")
    end
  end

end
