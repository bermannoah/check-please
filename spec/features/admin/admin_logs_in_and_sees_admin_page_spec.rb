require 'rails_helper'

describe "admin logs in" do
  # let(:server)  {create(:server)}
  scenario "user does see admin dashboard if role is admin" do
    admin = create(:admin)

    visit root_path

    click_on "Login"
    fill_in "username", with: admin.username
    fill_in "password", with: admin.password
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content(admin.name)
  end

  scenario "user does not see admin dashboard if role is default" do
    server = create(:server)

    visit root_path

    click_on "Login"
    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).not_to have_content("Admin Dashboard")
    expect(page).to have_content(server.name)
  end

  scenario "user with default role sees 404 when visiting admin/dashboard" do
    server = create(:server)

    visit root_path

    click_on "Login"
    fill_in "username", with: server.username
    fill_in "password", with: server.password
    click_button "Login"

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "unregistered user sees 404 when visiting admin/dashboard" do
    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
