require 'rails_helper'

feature "user removes items from ticket" do
  it "user can delete item from ticket" do
    item_1 = create(:item_with_category)
    category = item_1.category
    visit menu_path

    click_on category.name

    click_on "Add to Ticket"

    page.find("#ticket").click

    expect(current_path).to eq(tickets_path)
    expect(page).to have_content(item_1.name)

    click_on "Remove"

    expect(current_path).to eq(tickets_path)
    expect(page).to_not have_content(item_1.name)
  end
end
