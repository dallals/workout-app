require "rails_helper"


RSpec.feature "Sign in users and Sign Out User" do
	
	before do 
		@john = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
	end

	scenario "Sign in User" do 
		visit "/"
		click_link "Log In"
		fill_in "Email", with: "john@example.com"
		fill_in "Password", with: "password"
		click_button "Log in"

		expect(page).to have_content("Signed in successfully.")
		
	end

	scenario "Sign Out User" do 
		login_as(@john)
		visit "/"
		click_link "Sign Out"
		expect(page).to have_content("Signed out successfully.")
		expect(current_path).to eq(root_path)
	end
end