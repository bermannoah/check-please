require 'rails_helper'

describe "server logs in" do

  let(:server)  {create(:server)}

  scenario "the server sees the login button" do
    visit root_path

    expect(page).to have_content("Login")
  end

  scenario "the server is taken to the login page" do
    visit root_path
    click_on "Login"

    expect(path).to eq("/login")
  end

  scenario "server sees the form to login and logs in" do
    visit root_path
    click_on "Login"

    fill_in "server[username]", with: server.usernmae
    fill_in "server[password]", with: server.password
    click_button "Login"

    expect(current_path).to eq(/dashboard)
    expect(page).to have_content("Logged in as #{server.usernmae}")
  end
end
