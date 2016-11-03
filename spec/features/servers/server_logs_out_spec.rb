require 'rails_helper'

describe "server logs out" do
  scenario "server is able to log out" do

    server = create(:server)

    visit login_path

    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    expect(page).to have_content("Logout")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Successfully logged out!")
  end
end
