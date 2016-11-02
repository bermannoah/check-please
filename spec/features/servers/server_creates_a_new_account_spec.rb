require 'rails_helper'

describe "server creates a new account" do

  @server = Server.new(name: "Jeff", username: "j3", password: "321clap")

  scenario "server successfully creates a new account" do
    visit login_path

    click_on "Create Account"

    fill_in "server[name]", with: @server.name
    fill_in "server[username]", with: @server.username
    fill_in "server[password]", with: @server.password
    fill_in "server[password_confirmation]", with: @server.password
    click_on "Create"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as #{@server.username}")
    expect(page).to have_content("Name: #{@server.name}")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "server cannot create an account without a password" do
    visit login_path

    click_on "Create Account"

    fill_in "server[name]", with: @server.name
    fill_in "server[username]", with: @server.username
    click_on "Create"

    expect(flash[:failure]).to have_content("Please add a password!")
  end

  scenario "server cannot create an account without confirming password" do
    visit login_path

    click_on "Create Account"

    fill_in "server[name]", with: @server.name
    fill_in "server[username]", with: @server.username
    fill_in "server[password]", with: @server.password

    click_on "Create"

    expect(flash[:failure]).to have_content("Please confirm your password!")
  end

  scenario "server sees an error if they confirm wrong password" do
    visit login_path

    click_on "Create Account"

    fill_in "server[name]", with: @server.name
    fill_in "server[username]", with: @server.username
    fill_in "server[password]", with: @server.password
    fill_in "server[password_confirmation]", with: "1234"

    click_on "Create"

    expect(flash[:failure]).to have_content("Passwords must match!")
  end
end
