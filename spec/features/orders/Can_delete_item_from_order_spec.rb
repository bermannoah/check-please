require 'rails_helper'

feature "user removes items from order" do
  it "user can delete item from order" do
    item_1, item_2, item_3 = create_list(:item_with_category, 3)
    category = item_1.category

    visit menu_path

    click_on category.name

    click_on "Add to Order"

    click_on "Order"

    expect(current_path).to eq(orders_path)
    expect(page).to have_content(item_1.name)

    click_on "Remove"

    expect(current_path).to eq(orders_path)
    expect(page).to_not have_content(item_1.name)
  end
end
