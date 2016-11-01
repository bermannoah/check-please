require 'rails_helper'

describe "user visits items page"  do

  before :each do
    @item_1, @item_2, @item_3 = create_list(:item, 3)
  end

  it "user sees all item names" do

    visit items_path
    save_and_open_page

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_3.name)
  end

  it "user sees all item prices" do

    visit items_path

    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_2.price)
    expect(page).to have_content(@item_3.price)
  end
end
