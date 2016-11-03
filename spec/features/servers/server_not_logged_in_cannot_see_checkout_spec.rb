require 'rails_helper'

describe "server is not logged in" do

  scenario "server can add items to a ticket but cannot checkout" do
    item = create(:item_with_category)
    category = item.category
    
    visit menu_path
    
    click_on category.name
    
    click_on "Add to Ticket"
    
    page.find("#ticket").click
    
    expect(page).to_not have_button("Submit Ticket")
    expect(page).to have_content("to Submit Ticket")
    expect(page).to have_button("Create Account")
    expect(page).to have_button("Login")

  end
end