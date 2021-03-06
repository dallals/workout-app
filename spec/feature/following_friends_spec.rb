require "rails_helper"


RSpec.feature "following friends" do 
	before do
		@john = User.create(first_name: "John", last_name: "Dow", email: "john@example.com", password: "password")
		@peter = User.create(first_name: "Peter", last_name: "Whats", email: "peter@example.com", password: "password")

		login_as(@john)
	end	

	scenario "if signed in successfully add friends" do
		visit "/"


		expect(page).to have_content(@john.full_name)
		expect(page).to have_content(@peter.full_name)
		expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")

		link = "a[href='/friendships?friend_id=#{@peter.id}']"
		find(link).click

		expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@peter.id}")
	end

end