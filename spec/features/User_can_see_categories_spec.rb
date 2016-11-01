require "rails_helper"

RSpec.feature "user see categories across the top " do
  it "displays two categories across the top" do
    category_one = Category.create(name:"appetizers")
    category_two = Category.create(name:"beverages")

    visit menu_path


    expect(page).to have_content("appetizers")
    expect(page).to have_content("beverages")

  end
end
