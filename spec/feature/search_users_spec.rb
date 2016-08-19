require "rails_helper"


RSpec.feature "Search Users" do 
	before do 
		@john = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
		@sarah = User.create(first_name: "Sarah", last_name: "Dow", email: "sarah@example.com", password: "password")	
		# login_as(@john)
	end
	scenario "search users" do 

		visit "/"
		fill_in "search_name", with: "Dow"
		click_button "Search"

		expect(page).to have_content(@john.full_name)
		expect(page).to have_content(@sarah.full_name)
		expect(current_path).to eq("/dashboard/search")
	end
end