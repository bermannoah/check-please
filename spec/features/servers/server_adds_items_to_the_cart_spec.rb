require 'rails_helper'

describe "server adds items to the cart" do
  it "stores the selected items in the cart" do
    item_1, item_2  = create_list(:item_with_category, 2)
    category_1 = item_1.category

    visit menu_path
    click_link "#{category_1.name}"

    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("#{item_1.price}")

    click_on "Add to Ticket"

    expect(current_path).to eq(category_name_path(category_1.name))
  end
end
