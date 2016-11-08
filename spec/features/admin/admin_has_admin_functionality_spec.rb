require 'rails_helper'

describe "admin has admin funcionality" do
  it "admin can edit server role" do
    server = create(:server)
    admin = create(:admin)

    page.set_rack_session(server_id: admin.id)

    visit admin_dashboard_path

    expect(page).to have_content server.name
    expect(page).to have_content admin.name

    within("#server_#{server.id}") do
      expect(page).to have_select("server_role", options: [server.role, admin.role])
    end

    within("#server_#{server.id}") do
      select "admin", :from => "server_role"
      click_on "Update"
    end

    within("#server_#{server.id}") do
      expect(page).to_not have_select("server_role", options: [server.role])
    end

  end
end
