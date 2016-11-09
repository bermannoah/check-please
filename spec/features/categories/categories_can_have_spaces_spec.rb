require 'rails_helper'

describe "server views menu page" do
  scenario "there is a menu item with spaces" do
    category = Category.create(name: "Multiple Spaces Test")
    item = Item.create(name: "hello", price: 1.0, category: category)
    visit menu_path

    expect(page).to have_content("Multiple Spaces Test")

    click_on "Multiple Spaces Test"

    expect(page).to have_current_path("/multiple-spaces-test")
  end

end
