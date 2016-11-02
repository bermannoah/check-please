require 'rails_helper'

describe "server sees options for a new account" do

  let(:server)  {create(:server)}

  scenario "the server sees the login button" do
    visit root_path

    expect(page).to have_content("Login")
  end

  scenario "the server is taken to the login page" do
    visit root_path
    click_on "Login"

    expect(current_path).to eq("/login")
  end

  scenario "server sees the form to login" do
    visit root_path
    click_on "Login"

    expect(page.has_field?("username", type: text_area)).to eq(true)
    expect(page.has_field?("password", type: password)).to eq(true)
    expect(page).to have_link("Create Account")
  end
end
