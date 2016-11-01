require "rails_helper"

RSpec.feature "user see categories across the top " do
  it "displays two categories across the top" do
    category_one = Category.create(name:"appitizers")
    category_two = Category.create(name:"beverages")

    visit menu_path

    expect(page).to have_content(category_one.name)
    expect(page).to have_content(category_two.name)

  end
end
