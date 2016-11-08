require 'rails_helper'

RSpec.feature "Users clicks category" do
  it "goes to show and show's the items for that category" do
      item = create(:item_with_category)
      category = item.category
      visit menu_path

      click_on category.name

      expect(page).to have_content(item.name)
  end
end
