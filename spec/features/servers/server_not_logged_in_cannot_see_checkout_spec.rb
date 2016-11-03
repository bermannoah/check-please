require 'rails_helper'

describe "server is not logged in" do

  scenario "server can add items to a ticket but cannot checkout" do
    item = create(:item_with_category)
    category = item.category
    
    visit menu_path
    
    click_on category.name
    
    click_on "Add to Ticket"
    
    page.find("#ticket").click
    
    expect(page).to have_content(item.name)
    expect(page).to_not have_button("Submit Ticket")
    expect(page).to have_content("to Submit Ticket")
    expect(page).to have_button("Create Account")
    expect(page).to have_button("Login")

  end
  
  scenario "server can add items to cart once logged in" do
    server = create(:server)
    item = create(:item_with_category)
    category = item.category

    visit menu_path

    click_on category.name

    click_on "Add to Ticket"

    page.find("#ticket").click

    expect(page).to have_content(item.name)

    page.find("#ticket_login").click

    fill_in "username", with: server.username
    fill_in "password", with: server.password

    click_button "Login"
    expect(page).to have_content(server.username)
    
    page.find("#ticket").click
    expect(page).to have_content(item.name)

    click_on "Logout"
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")

  end
end