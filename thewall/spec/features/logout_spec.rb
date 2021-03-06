require 'rails_helper'
feature "creating account" do
    before(:each) do
        visit new_user_path
        fill_in "user_username", with: "Keikish"
        click_button "Create"
    end

    scenario "successfully logs out" do
        expect(page).to have_content "Log Out"
        click_on "Log Out"
        expect(page).to have_current_path(new_user_path)
    end
end