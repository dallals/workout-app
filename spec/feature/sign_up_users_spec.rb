require "rails_helper"


RSpec.feature "Users Signup" do 
	scenario "with valid credentials" do 
		visit "/"

		click_link "Sign up"
		fill_in "First name", with: "Sammy"
		fill_in "Last name", with: "Dallal"
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"

		click_button "Sign up"

		expect(page).to have_content("Welcome! You have signed up successfully.")
		expect(current_path).to eq(root_path)

	end
end

