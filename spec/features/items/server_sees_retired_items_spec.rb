require 'rails_helper'

describe "server sees items" do
  it "server sees all unretired items" do
    category = create(:category)
    item_1 = create(:item, category_id: category.id)
    item_2 = create(:item, category_id: category.id)

    visit menu_path

    click_on category.name

    within "#item_#{item_1.id}" do
      expect(page).to have_button("Add to Ticket")
    end

    within "#item_#{item_2.id}" do
      expect(page).to have_button("Add to Ticket")
    end
  end

  it "server does not see retired items" do
    category = create(:category)
    item_1 = create(:item, category_id: category.id)
    item_2 = create(:item, category_id: category.id, retired: "Y")

    visit menu_path

    click_on category.name

    within "#item_#{item_1.id}" do
      expect(page).to have_button("Add to Ticket")
    end

    within "#item_#{item_2.id}" do
      expect(page).to have_button("Item Retired")
    end
  end
end
