require 'rails_helper'

describe "server is not logged in" do

  scenario "server can add items to a ticket but cannot checkout" do
    item = create(:item_with_category)
    category = item.category
    
    visit menu_path
    
    click_on category.name
    
    click_on "Add to Ticket"
    
    page.find("#ticket").click
    
    expect(page).to_not have_content("Submit Ticket")
    expect(page).to have_content("Login or Create Account to Submit Ticket")
  end
end