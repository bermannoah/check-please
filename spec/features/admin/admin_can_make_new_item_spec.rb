require 'rails_helper'

RSpec.feature "admin can add new item" do
  before :each do
    @admin = create(:admin)
    @category = create(:category)
    page.set_rack_session(server_id: @admin.id)

    visit admin_dashboard_path
  end

  it "they can edit an item" do
    click_link "New Item"

    expect(current_path).to eq(new_admin_item_path)

    fill_in 'item[name]', with: "Test Item"
    fill_in 'item[price]', with: "3.00"
    select @category.name, :from => "item[category_id]"

    click_button "Submit"

    expect(current_path).to eq(item_path(Item.last.id))

    expect(page).to have_content("Test Item")
    expect(page).to have_content("3.00")
  end

end
