require 'rails_helper'

feature "creating account" do
    before(:each) do
        visit "users/new"
    end
    scenario "successfully creates a new user account" do
        fill_in "user_username", with: "Keikish"
        click_button "Create"
        expect(page).to have_content "Welcome, Keikish"
        expect(page).to have_current_path("/messages")
    end
    scenario "invalid user account" do
        click_button "Create"
        expect(current_path).to eq(new_user_path)
    end
    scenario "doesn't fill out username field" do
        click_button "Create"
        expect(page).to have_content "Username cannot be blank!"
    end
end