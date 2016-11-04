require 'rails_helper'

describe "admin logs in" do
  scenario "they the edit button" do
    log_in_admin

    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Edit Admin Account")
  end

  scenario "they are able to edit their own account" do
    log_in_admin

    click_on "Edit Admin Account"

    fill_in "server[name]", with: "Noah"
    fill_in "server[username]", with: "bermannoah"

    click_on "Update"

    expect(page).to_not have_content(@admin.name)
    expect(page).to have_content("Noah")
  end
end
