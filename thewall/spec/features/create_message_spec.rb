require 'rails_helper'

feature "creating account" do
    before(:each) do
        visit new_user_path
        fill_in "user_username", with: "Keikish"
        click_button "Create"
    end
    scenario "successfully creates a new message" do
        fill_in "message_content", with: "I am a golden god"
        click_button "Post a Message"
        expect(page).to have_content "#{Message.last.content}"
        expect(current_path).to eq(messages_path) 
    end
    scenario "error creating a new message" do
        click_button "Post a Message"
        expect(current_path).to eq(messages_path)
    end
    scenario "does not fill out content field" do
        click_button "Post a Message"
        expect(page).to have_content "Content cannot be blank!"
    end
end