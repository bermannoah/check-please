require "rails_helper"

RSpec.feature "User changes quantity in order index view" do
  it "changes quantity to users selected number" do
    item = create(:item_with_category)
    category = item.category

    visit category_name_path(category.name)

    click_on "Add to Order"
    click_on "Add to Order"

    page.find("#ORDER").click

    expect(page).to have_content("2")

    fill_in "order[quantity]", with: "1"

    click_on "Update"

    expect(page).to have_content("1")
  end
end
