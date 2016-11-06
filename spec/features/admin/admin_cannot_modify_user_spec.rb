require 'rails_helper'

describe "admin logs in" do
  scenario "they see the edit button" do
    log_in_admin

    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Edit Admin Account")
  end

  scenario "they are able to edit their own account" do
    log_in_admin

    click_on "Edit Admin Account"

    fill_in "server[name]", with: "Noah"
    fill_in "server[username]", with: "bermannoah"
    fill_in "server[password]", with: @admin.password
    fill_in "server[password_confirmation]", with: @admin.password

    click_on "Update"

    expect(page).to have_content("Your account data has been updated!")
    expect(page).to_not have_content(@admin.name)
    expect(page).to have_content("Noah")
  end

  scenario "they are unable to edit another server account" do
    server = create(:server)
    log_in_admin

    visit "/admin/servers/#{server.id}/edit"

    expect(page).to have_content("You do not have access to this account!")
    expect(current_path).to eq("/admin/dashboard")
    expect(page).to have_content(@admin.name)
  end
end
