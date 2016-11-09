require 'rails_helper'

RSpec.feature "admin can edit items" do
  before :each do
    @admin = create(:admin)
    @item_1, @item_2 = create_list(:item_with_category, 2)
    page.set_rack_session(server_id: @admin.id)

    visit admin_dashboard_path
  end

  it "they can edit an item" do
    click_link "#{@item_1.name}"

    expect(current_path).to eq(edit_admin_item_path(@item_1))

    fill_in 'item[name]', with: "Test Item"
    click_button "Submit"
    expect(page).to have_content("Test Item")
    expect(page).not_to have_content(@item_1.name)
  end

  it "they can edit the category" do
    category_1 = @item_1.category
    category_2 = create(:category)

    click_link "#{@item_1.name}"
    expect(current_path).to eq(edit_admin_item_path(@item_1))
    expect(page).to have_select("item[category_id]", options: [category_1.name, @item_2.category.name, category_2.name])

    select category_2.name, :from => "item[category_id]"
    click_button "Submit"

    within (".item_#{@item_1.id}") do
      expect(page).to have_content(category_2.name)
    end
  end

end
