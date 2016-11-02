require "rails_helper"

RSpec.feature "users sees item quantities" do
  it "shows item quantity" do
    item_1 = create(:item_with_category)
    category = item_1.category

    visit menu_path

    click_on category.name
    click_on "Add to Order"

    within("#ORDER"){click_on "Order"}

    expect(page).to have_content("Quantity")
    expect(page).to have_content("1")

  end
end
