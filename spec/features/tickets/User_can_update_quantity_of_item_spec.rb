require "rails_helper"

RSpec.feature "User changes quantity in ticket index view" do
  it "changes quantity to users selected number" do
    item = create(:item_with_category)
    category = item.category

    visit category_name_path(category.name)

    click_on "Add to Ticket"
    click_on "Add to Ticket"

    page.find("#ticket").click

    expect(page).to have_selector("input[value='2']")

    find("#quantity").set ("1")

    click_on "Update"

    expect(page).to have_selector("input[value='1']")
  end
end
