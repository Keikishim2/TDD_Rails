require 'rails_helper'
feature 'guest user creates an account' do
    before(:each) do
        visit new_user_path
    end
    scenario 'successfully creates a new user account' do
        fill_in 'user_first_name', with: 'Netzuko'
        fill_in 'user_last_name', with: 'Kamado'
        fill_in 'user_email', with: 'netz@gmail.com'
        click_button 'Create User'
        expect(page).to have_content 'Welcome, Netzuko'
        expect(page).to have_current_path(user_path(User.last))
    end
    scenario "unsuccessfully creates a new user account" do
        click_button 'Create User'
        expect(current_path).to eq(new_user_path)
    end
    scenario "doesnt fill out first name field" do
        fill_in 'user_last_name', with: 'tanjiro'
        fill_in 'user_email', with: 'tan@gmail.com'
        click_button 'Create User'
        expect(page).to have_content "First name can't be blank"
    end
    scenario "does not fill out last name field" do
        fill_in 'user_first_name', with: 'Tanjiro'
        fill_in 'user_email', with: 'tan@gmail.com'
        click_button 'Create User'
        expect(page).to have_content "Last name can't be blank"
    end
    scenario "does not fill out email field" do
        fill_in 'user_first_name', with: 'Tanjiro'
        fill_in 'user_last_name', with: 'Kamado'
        click_button 'Create User'
        expect(page).to have_content "Email is invalid"
    end
end