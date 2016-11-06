require 'rails_helper'

describe "admin has admin funcionality" do
  it "admin can edit server role" do
    server = create(:server)
    admin = create(:admin)

    page.set_rack_session(server_id: admin.id)

    visit admin_dashboard_path

    expect(page).to have_content server.name
    expect(page).to have_content admin.name

    find(:xpath, '//option[contains(text(), "Admin")]').select_option

    
  end
end
